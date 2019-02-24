import 'package:angular/angular.dart';
import '../stores/test_store.dart';
import 'package:angular_mobx/angular_mobx.dart';

@Component(
  selector: 'my-app',
  template: '''
<div *mobxReaction="testChanges">
  <span id="fullname">{{store.fullName}}</span>
  <input type="checkbox" [checked]="store.isAdult"  (change)="store.toggleAdult()">
</div>
<button id="setLastNameBtn" (click)="setLastName()">Set Name</button>
<button id="unrelatedBtn" (click)="doSomethingUnrelated()">Do something unrelated</button>

  ''',
  changeDetection: ChangeDetectionStrategy.OnPush,
  directives: [MobxReactionDirective],
)
class TestReactionComponent {
  var store = globalStore;

  void setLastName() {
    store.setNames(store.firstName, 'Dean');
  }

  doSomethingUnrelated() {}
  testChanges(_)=>'${store.fullName}|${store.isAdult}';
}
