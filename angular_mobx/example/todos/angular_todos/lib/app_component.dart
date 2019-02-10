import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:store/store.dart';
//import 'package:angular_todos/src/counter_page/counter_page_component.dart';
import 'src/footer/footer_component.dart';
import 'src/section/section_component.dart';
@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: const [
    coreDirectives,
    formDirectives,
    FooterComponent,
    SectionComponent,
  ],

  providers: [ClassProvider(TodoList)],
)
class AppComponent {
  TodoList todos;
  AppComponent(this.todos);
  addTodo() {
     todos.addTodo(todos.currentDescription);
  }
}
