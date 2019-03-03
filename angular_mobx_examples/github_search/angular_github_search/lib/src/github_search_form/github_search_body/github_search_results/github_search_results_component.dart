import 'package:angular/angular.dart';

import 'package:store/store.dart';
import 'package:angular_github_search/src/github_search.dart';

@Component(
  selector: 'github-search-results',
  templateUrl: 'github_search_results_component.html',
  directives: [coreDirectives, SearchResultItemComponent],
)
class SearchResultsComponent {
  GithubStore store;

  SearchResultsComponent(this.store);
}
