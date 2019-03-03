import 'package:angular/angular.dart';
import 'package:angular_mobx/angular_mobx.dart';
import 'package:store/common.dart';
import 'dart:html';

@Component(
    selector: 'todo-item',
    templateUrl: 'todo_item_component.html',
    changeDetection: ChangeDetectionStrategy.OnPush,
    directives: [NgFor, NgIf])
class TodoItemComponent extends MobxBaseComponent {
  TodoList todos;
  @Input()
  Todo todo;
  @ViewChild('label')
  Element label;

  TodoItemComponent(this.todos, ChangeDetectorRef changeDetector)
      : super(changeDetector);

  void touchObservables() {
    todo.editing;
    todo.description;
    todo.done;
  }


  ngOnInit() {
    super.ngOnInit();
    subscriptions.add(label.onDoubleClick.listen((_) {
      todos.startEditing(todo);
    }));
  }
}
