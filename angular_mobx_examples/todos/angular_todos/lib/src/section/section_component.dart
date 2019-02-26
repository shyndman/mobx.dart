import 'package:angular/angular.dart';
import 'package:angular_mobx/angular_mobx.dart';
import 'package:store/store.dart';

import 'todo_item/todo_item_component.dart';

@Component(
    selector: 'app-section',
    templateUrl: 'section_component.html',
    changeDetection: ChangeDetectionStrategy.OnPush,
    directives: [NgFor, NgIf, TodoItemComponent, MobxAutorun])
class SectionComponent {
  TodoList todos;

  SectionComponent(this.todos);
}
