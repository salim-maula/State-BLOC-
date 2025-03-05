import 'package:bloc/bloc.dart';
import 'package:state_bloc/bloc/counter_event.dart';

// class CounterBloc extends Cubit<int> {
//   CounterBloc() : super(0);

//   void add() => emit(state + 1);
//   void remove() => emit(state - 1);
// }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<DecrementCounter>((event, emit) {
      emit((state - 1) * event.value);
    });
    on<IncrementCounter>((event, emit) {
      emit((state + 1) * event.value);
    });
  }
}
