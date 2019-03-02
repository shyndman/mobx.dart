import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import '../github.dart';
import 'debouncer.dart';

part 'github_store.g.dart';

class GithubStore = _GithubStore with _$GithubStore;

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
  bool waitingForInputCompletion = false;

  @observable
  ObservableFuture fetchReposFuture = emptyResponse;

  @observable
  bool isEmpty = true;

  @computed
  bool get hasResults =>
      !isEmpty && fetchReposFuture.status == FutureStatus.fulfilled;

  @computed
  bool get isPending =>
      fetchReposFuture.status == FutureStatus.pending ||
      waitingForInputCompletion;

  @computed
  bool get resultIsEmpty =>
      fetchReposFuture.status == FutureStatus.fulfilled &&
      isEmpty &&
      searchToken.isNotEmpty &&
      !isPending;

  @computed
  bool get isRejected => fetchReposFuture.status == FutureStatus.rejected;

  @computed
  String get statusDescription =>
      'searchToken: $searchToken, isPending: $isPending, resultIsEmpty $resultIsEmpty, waitingForInput: $waitingForInputCompletion, hasResults: $hasResults, count: ${repositories.length}, isEmpty: $isEmpty, ${fetchReposFuture.status}';

  @action
  void setSearchToken(String text) {
    if (searchToken == text) {
      return;
    }
    searchToken = text;
    fetchReposFuture = emptyResponse;
    setRepositories([]);
    waitingForInputCompletion = true;
  }

  @action
  Future<void> fetchRepos() async {
    if (searchToken == null || searchToken.trim() == '') {
      waitingForInputCompletion = false;
      return;
    }
    final future = githubRepository.search(searchToken);
    fetchReposFuture = ObservableFuture(future);
    waitingForInputCompletion = false;
    try {
      setRepositories((await future).items);
    } catch (e) {}
  }

  @action
  setRepositories(List<SearchResultItem> value) {
    _repositories = value;
    isEmpty = _repositories.isEmpty;
  }

  void close() {
    httpClient.close();
    debouncer?.close();
  }
}
