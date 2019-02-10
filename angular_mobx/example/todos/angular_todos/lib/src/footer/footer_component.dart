import 'package:angular/angular.dart';
import 'package:store/store.dart';
import 'package:angular_mobx/angular_mobx.dart';

@Component(
  selector: 'app-footer',
  templateUrl: 'footer_component.html',
  directives: [MobxAutorunDirective, NgIf],
  exports: [VisibilityFilter]
)
class FooterComponent {
  TodoList todos;
  FooterComponent(this.todos);
}
