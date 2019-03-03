import 'package:angular/angular.dart';
import 'package:store/store.dart';

@Component(
  selector: 'github-search-result-item',
  templateUrl: 'github_search_result_item_component.html',
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class SearchResultItemComponent {
  @Input()
  SearchResultItem item;
}
