import 'package:angular/angular.dart';

import 'package:angular_github_search/src/github_search.dart';

@Component(
  selector: 'github-search-form',
  templateUrl: 'github_search_form_component.html',
  directives: [
    SearchBarComponent,
    SearchBodyComponent,
  ],
)
class SearchFormComponent {}
