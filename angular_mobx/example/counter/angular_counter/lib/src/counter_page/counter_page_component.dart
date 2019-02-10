import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'package:store/store.dart';
import 'package:angular_mobx/angular_mobx.dart';

@Component(
  selector: 'counter-page',
  templateUrl: 'counter_page_component.html',
  styleUrls: ['counter_page_component.css'],
  directives: [MaterialFabComponent, MobxAutorunDirective],
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class CounterPageComponent {
  final Counter counter;

  CounterPageComponent(this.counter);
}
