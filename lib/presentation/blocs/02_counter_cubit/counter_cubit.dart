import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment(int value) => emit(state + value);

  void decrement() => emit(state - 1);

  void reset() => emit(0);
}
