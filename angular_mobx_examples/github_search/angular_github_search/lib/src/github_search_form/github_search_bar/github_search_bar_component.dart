import 'package:angular/angular.dart';
import 'package:mobx/mobx.dart';
import 'package:store/store.dart';

@Component(
  selector: 'github-search-bar',
  templateUrl: 'github_search_bar_component.html',
)
class SearchBarComponent {
  GithubStore store;

  SearchBarComponent(this.store);
}
