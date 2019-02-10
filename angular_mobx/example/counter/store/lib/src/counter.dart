import 'dart:async';
import 'package:mobx/mobx.dart';

part 'counter.g.dart';

Counter counterSingleton = Counter();

class Counter = CounterBase with _$Counter;

abstract class CounterBase implements Store {
  Timer timer;
  @observable
  int value = 0;

  @action
  void increment() {
    print('Incrementing counter: old value $value');
    value++;
  }

  @action
  void decrement() {
    value--;
  }

  startTimer() {
    stopTimer();
    timer = Timer.periodic(Duration(seconds: 1), (_) => increment());
  }
  
  stopTimer() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
  }
}
