import 'package:angular/angular.dart';
import 'package:store/store.dart';
import 'package:angular_counter/src/counter_page/counter_page_component.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [CounterPageComponent],
  providers: [ClassProvider(Counter)],
)
class AppComponent {}
