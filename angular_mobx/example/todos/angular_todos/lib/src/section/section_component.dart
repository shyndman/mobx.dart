import 'package:angular/angular.dart';
import 'package:angular_mobx/angular_mobx.dart';
import 'package:store/store.dart';

@Component(
  selector: 'app-section',
  templateUrl: 'section_component.html',
  directives: [NgFor, NgIf, MobxAutorunDirective]
)
class SectionComponent {
  TodoList todos;
  SectionComponent(this.todos);
}
