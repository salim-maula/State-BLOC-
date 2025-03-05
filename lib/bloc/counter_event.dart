// enum CounterEvent {
//   decrement,
//   increment,
// }

class CounterEvent {
  CounterEvent(this.value);
  int value;
}

class DecrementCounter extends CounterEvent {
  DecrementCounter(int value) : super(value);
}

class IncrementCounter extends CounterEvent {
  IncrementCounter(int value) : super(value);
}
