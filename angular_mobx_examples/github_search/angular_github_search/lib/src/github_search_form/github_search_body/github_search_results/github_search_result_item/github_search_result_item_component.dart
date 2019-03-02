import 'package:angular/angular.dart';
import 'package:github/browser.dart';


@Component(
  selector: 'github-search-result-item',
  templateUrl: 'github_search_result_item_component.html',
)
class SearchResultItemComponent {
  @Input()
  Repository item;
}
