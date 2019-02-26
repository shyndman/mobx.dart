import 'package:angular/angular.dart';
import 'src/store/counter.dart';
import 'package:angular_counter/src/counter_page/counter_page_component.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [CounterPageComponent, MaterialFabComponent],
  providers: [ClassProvider(Counter)],
)
class AppComponent {
  final Counter counter;
  AppComponent(this.counter);
}
