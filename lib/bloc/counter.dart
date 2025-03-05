import 'package:bloc/bloc.dart';
import 'package:state_bloc/bloc/counter_event.dart';

// class CounterBloc extends Cubit<int> {
//   CounterBloc() : super(0);

//   void add() => emit(state + 1);
//   void remove() => emit(state - 1);
// }


class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      if (event == CounterEvent.decrement) {
        emit(state - 1);
      } else {
        emit(state + 1);
      }
    });
  }
}
