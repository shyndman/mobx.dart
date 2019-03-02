import 'package:angular/angular.dart';

import 'package:angular_github_search/src/github_search.dart';
import 'package:github/browser.dart';
import 'package:store/store.dart';

GithubStore makeStore() {
  var github = createGitHubClient();
  var store = GithubStore(github, debounceMilliseconds: 0);
  return store;
}

@Component(
  selector: 'my-app',
  template: '<github-search-form></github-search-form>',
  directives: [SearchFormComponent],
  providers: [FactoryProvider(GithubStore, makeStore)],
)
class AppComponent {}
