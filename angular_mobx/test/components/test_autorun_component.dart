import 'package:angular/angular.dart';
import '../stores/test_store.dart';
import 'package:angular_mobx/angular_mobx.dart';

@Component(
  selector: 'my-app',
  template: '''
<div *mobxAutorun>
  <span id="fullname">{{store.fullName}}</span>
</div>
<button (click)="setLastName()">Set Name</button>
  ''',
  changeDetection: ChangeDetectionStrategy.OnPush,
  directives: [MobxAutorunDirective],
)
class TestAutorunComponent {
  var store = globalStore;

  void setLastName() {
    store.setNames(store.firstName, 'Dean');
  }
}
