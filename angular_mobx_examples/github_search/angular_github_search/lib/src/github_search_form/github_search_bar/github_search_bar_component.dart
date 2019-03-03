import 'package:angular/angular.dart';
import 'package:store/store.dart';

@Component(
  selector: 'github-search-bar',
  templateUrl: 'github_search_bar_component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class SearchBarComponent {
  GithubStore store;

  SearchBarComponent(this.store);
}
