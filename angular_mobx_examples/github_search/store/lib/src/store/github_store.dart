import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';
import '../github.dart';

part 'github_store.g.dart';

class GithubStore = _GithubStore with _$GithubStore;

enum StoreStatus { empty, pending, fulfilled, rejected }

abstract class _GithubStore implements Store {
  GithubRepository githubRepository;

  var _rawSearches = StreamController<String>();
  Stream<String> _debouncedSearches;
  StreamSubscription<String> _searchSubscription;
  http.Client httpClient;
  bool debouncing = false;
  int debounceMilliseconds;

  _GithubStore(this.httpClient, {this.debounceMilliseconds = 500}) {
    githubRepository = createRepository(httpClient);
  }

  startDebouncing() {
    _debouncedSearches = _rawSearches.stream
        .transform(debounce(Duration(milliseconds: debounceMilliseconds)));
    _searchSubscription = _debouncedSearches.listen((_) => fetchRepos());
    debouncing = true;
  }

// No need to observe this as we are relying on the fetchReposFuture.status
  @observable
  List<SearchResultItem> repositories = [];

  @observable
  StoreStatus status = StoreStatus.empty;

  @observable
  String searchToken = '';

  @observable
  String error = '';

  Future<List<SearchResult>> searchFuture;

  @computed
  bool get hasResults =>
      status == StoreStatus.fulfilled && repositories.isNotEmpty;

  static ObservableFuture<List<SearchResult>> emptyResponse =
      ObservableFuture.value([]);

  @action
  startSearch() {
    repositories = [];
    setStatus(StoreStatus.pending);
  }

  @action
  void completeWithSuccess(List<SearchResultItem> repos) {
    repositories = repos;
    setStatus(StoreStatus.fulfilled);
  }

  void completeWithError(String errorMessage) {
    error = errorMessage;
    setStatus(StoreStatus.rejected);
  }

  @action
  void setStatus(StoreStatus newStatus) {
    status = newStatus;
  }

  @action
  void setSearchToken(String text) {
    searchToken = text;
    if (debouncing) {
      _rawSearches.add(searchToken);
    }
  }

  void close() {
    _searchSubscription.cancel;
  }

  Future<void> fetchRepos() async {
    if (searchToken.isEmpty) {
      setStatus(StoreStatus.empty);
      return;
    }
    try {
      startSearch();
      var repos = await githubRepository.search(searchToken);
      completeWithSuccess(repos.items);
    } catch (error) {
      completeWithError(error.toString());
    }
  }
}
