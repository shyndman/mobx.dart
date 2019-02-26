import 'dart:async';
import 'package:mobx/mobx.dart';

part 'counter.g.dart';

Counter counterSingleton = Counter();

class Counter = _Counter with _$Counter;

abstract class _Counter implements Store {
  Timer timer;
  @observable
  int value = 0;


  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }

  @action
  startTimer() {
    stopTimer();
    timer = Timer.periodic(Duration(seconds: 1), (_) => increment());
  }

  @action
  stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }

}
