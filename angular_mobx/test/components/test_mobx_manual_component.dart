import 'dart:async';
import 'package:angular/angular.dart';
import 'package:mobx/mobx.dart';
import '../stores/test_store.dart';

@Component(
  selector: 'my-app',
  template: '''
<div>
  <input type="checkbox" [checked]="store.isAdult"  (change)="store.toggleAdult()">
  <span id="fullname">{{store.fullName}}</span>
</div>
<button id="setLastNameBtn" (click)="setLastName()">Set Name</button>
<button id="unrelatedBtn" (click)="doSomethingUnrelated()">Do something unrelated</button>

  ''',
  changeDetection: ChangeDetectionStrategy.OnPush,
)
class TestMobxManualComponent implements OnDestroy, OnInit {
  var store = globalStore;
  ChangeDetectorRef detectorRef;
  ReactionDisposer dispose;
  List<StreamSubscription> subscriptions = <StreamSubscription>[];

  TestMobxManualComponent(this.detectorRef);

  void ngOnInit() {
    dispose = autorun((_) {
      store.fullName;
      store.isAdult;
      detectorRef.markForCheck();
      //TODO this is necessary only for tests, should be avoidable
      detectorRef.detectChanges();
    });
  }

  void ngOnDestroy() {
    dispose();
    for (var each in subscriptions) {
      each.cancel();
    }
  }

  void setLastName() {
    store.setNames(store.firstName, 'Dean');
  }

  doSomethingUnrelated() {}
}
