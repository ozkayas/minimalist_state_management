import 'package:flutter/cupertino.dart';

class CounterState {
  // int _counter = 0;
  ValueNotifier<int> counter = ValueNotifier<int>(0);

  void incrementCounter() {
    counter.value++;
    // print(_counter.value);
  }

  void decrementCounter() {
    counter.value--;
    // print(_counter.value);
  }

  void resetCounter() {
    counter.value = 0;
    // print(_counter.value);
  }
}
