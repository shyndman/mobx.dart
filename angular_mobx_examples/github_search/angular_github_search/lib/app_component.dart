import 'package:angular/angular.dart';
import 'package:http/browser_client.dart';
import 'package:mobx/mobx.dart';

import 'package:angular_github_search/src/github_search.dart';
import 'package:store/store.dart';

const millisecondsToDelay = 500;

ReactionDisposer logState(GithubStore store) {
  return autorun((_) {
    print(store.storeStatusString);
  });
}

GithubStore makeStore() {
  var httpClient = BrowserClient();
  var store =
      GithubStore(httpClient, debounceMilliseconds: millisecondsToDelay);
  logState(store);
  return store;
}

GithubStore makeStoreWithMobxDelay() {
  var httpClient = BrowserClient();
  var store = GithubStore(httpClient);
  autorun((_) {
    store.searchToken;
    store.fetchRepos();
  }, delay: millisecondsToDelay);
  logState(store);
  return store;
}

@Component(
  selector: 'my-app',
  template: '<github-search-form></github-search-form>',
  directives: [SearchFormComponent],
  providers: [FactoryProvider(GithubStore, makeStore)],
)
class AppComponent {}
