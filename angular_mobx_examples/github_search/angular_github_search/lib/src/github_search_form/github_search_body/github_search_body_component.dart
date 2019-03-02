import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_mobx/angular_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:store/store.dart';
import 'package:angular_github_search/src/github_search.dart';

@Component(
  selector: 'github-search-body',
  templateUrl: 'github_search_body_component.html',
  directives: [
    coreDirectives,
    MaterialSpinnerComponent,
    MaterialIconComponent,
    SearchResultsComponent,
    MobxAutorun,
  ],
  exports: [StoreStatus]
)
class SearchBodyComponent {
  GithubStore store;

  SearchBodyComponent(this.store);
}
