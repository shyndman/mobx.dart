import 'package:angular/angular.dart';
import 'package:angular_mobx/angular_mobx.dart';
import 'package:store/store.dart';

import '../todo_component/todo_component.dart';

@Component(
  selector: 'app-section',
  templateUrl: 'section_component.html',
  directives: [NgFor, NgIf, MobxAutorunDirective, TodoItemComponent]
)
class SectionComponent {
  TodoList todos;
  SectionComponent(this.todos);
}
