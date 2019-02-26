import 'package:angular/angular.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';

abstract class MobxBaseComponent implements OnDestroy, OnInit {
  void touchObservables();
  ReactionDisposer dispose;
  ChangeDetectorRef detectorRef;
  List<StreamSubscription> subscriptions = <StreamSubscription>[];

  MobxBaseComponent(this.detectorRef);

  void ngOnInit() {
    dispose = autorun((_) {
      touchObservables();
      detectorRef.markForCheck();
    });
  }

  void ngOnDestroy() {
    dispose();
    for (var each in subscriptions) {
      each.cancel();
    }
  }
}
