import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

class CounterStateProvider extends StateNotifier<CounterState> {
  CounterStateProvider([
    CounterState initialState = const CounterState(counterValue: 0),
  ]) : super(initialState);

  increment() {
    print('Прибавляем 1');
    state = state.copyWith(counterValue: state.counterValue + 1);
    print('Прибавили 1');
  }

  decrement() {
    print('Убавляем 1');
    state = state.copyWith(counterValue: state.counterValue - 1);
    print('Убавили 1');
  }

  setValue(int value) {
    print('Задаем $value');
    state = state.copyWith(counterValue: value);
    print('Задали $value');
  }

  CounterState get value => state;
}
