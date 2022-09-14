import 'package:bloc/bloc.dart';
import 'package:testblock/bussines_logic/counter_state.dart';

class Counter_cubit extends Cubit<Counter_State>{
  Counter_cubit() : super(Counter_State(counterValue: 0));

  void incrementState()=> emit(Counter_State(counterValue: state.counterValue + 1 , waschange: true));
  void decrementState()=> emit(Counter_State(counterValue: state.counterValue - 1 , waschange: false));

}

