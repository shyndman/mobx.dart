import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../github.dart';
import 'debouncer.dart';

part 'github_store.g.dart';

class GithubStore = _GithubStore with _$GithubStore;

enum StoreStatus {
  initial,
  emptyResult,
  hasResults,
  waitingForKeyboard,
  waitingForNetwork,
  error,
  unknown
}

abstract class _GithubStore implements Store {
  GithubRepository githubRepository;
  Debouncer debouncer;
  http.Client httpClient;

  _GithubStore(this.httpClient, {int debounceMilliseconds = 0}) {
    githubRepository = createRepository(httpClient);
    if (debounceMilliseconds != 0) {
      debouncer = Debouncer(
          () => searchToken, (_) => fetchRepos(), debounceMilliseconds);
    }
  }

  static ObservableFuture emptyResponse =
      ObservableFuture.value(SearchResult.empty);

  List<SearchResultItem> _repositories = [];

  List<SearchResultItem> get repositories => _repositories;

  @observable
  String searchToken = '';

  @observable
  bool waitingForKeyboard = false;

  @observable
  ObservableFuture fetchReposFuture = emptyResponse;

  @observable
  bool isRepositoryListEmpty = true;

  @computed
  bool get hasResults =>
      !isRepositoryListEmpty &&
      fetchReposFuture.status == FutureStatus.fulfilled;

  @computed
  bool get isPending =>
      fetchReposFuture.status == FutureStatus.pending || waitingForKeyboard;

  @computed
  bool get waitingForNetwork => fetchReposFuture.status == FutureStatus.pending;

  @computed
  bool get resultIsEmpty =>
      fetchReposFuture.status == FutureStatus.fulfilled &&
      isRepositoryListEmpty &&
      searchToken.isNotEmpty &&
      !isPending;

  @computed
  bool get isRejected => fetchReposFuture.status == FutureStatus.rejected;

  @computed
  String get storeStatusString => 'searchToken: $searchToken,status: $status';

  @computed
  StoreStatus get status {
    if (fetchReposFuture == emptyResponse && searchToken.isEmpty) {
      return StoreStatus.initial;
    }
    if (fetchReposFuture.status == FutureStatus.fulfilled &&
        isRepositoryListEmpty &&
        searchToken.isNotEmpty &&
        !isPending) {
      return StoreStatus.emptyResult;
    }
    if (!isRepositoryListEmpty &&
        fetchReposFuture.status == FutureStatus.fulfilled) {
      return StoreStatus.hasResults;
    }
    if (fetchReposFuture.status == FutureStatus.rejected) {
      return StoreStatus.error;
    }
    if (fetchReposFuture.status == FutureStatus.pending) {
      return StoreStatus.waitingForNetwork;
    }
    if (waitingForKeyboard) {
      return StoreStatus.waitingForKeyboard;
    }
    return StoreStatus.unknown;
  }

  @action
  void setSearchToken(String text) {
    if (searchToken == text) {
      return;
    }
    searchToken = text;
    fetchReposFuture = emptyResponse;
    setRepositories([]);
    waitingForKeyboard = true;
  }

  @action
  Future<void> fetchRepos() async {
    waitingForKeyboard = false;
    if (searchToken == null || searchToken.trim() == '') {
      return;
    }
    final future = githubRepository.search(searchToken);
    fetchReposFuture = ObservableFuture(future);
    try {
      setRepositories((await future).items);
    } catch (e) {}
  }

  @action
  setRepositories(List<SearchResultItem> value) {
    _repositories = value;
    isRepositoryListEmpty = _repositories.isEmpty;
  }

  void close() {
    httpClient.close();
    debouncer?.close();
  }
}
