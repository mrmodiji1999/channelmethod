import 'package:demo/bloc/event.dart';
import 'package:demo/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<Increment>((event, emit) => emit(CounterState(state.counterValue + 1)));
    on<Decrement>((event, emit) => emit(CounterState(state.counterValue - 1)));
  }
}
