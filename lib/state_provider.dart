import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model.dart';

class CounterStateProvider extends StateNotifier<CounterState> {
  CounterStateProvider([
    CounterState initialState = const CounterState(),
  ]) : super(initialState);

  increment() {
    print('Прибавляем 1');
    state = state.copyWith(pageIndex: state.pageIndex + 1);
    print('Прибавили 1');
  }

  decrement() {
    print('Убавляем 1');
    state = state.copyWith(pageIndex: state.pageIndex - 1);
    print('Убавили 1');
  }

  appendToList(List<int> list) {
    state = state.copyWith(list: [
      ...state.list,
      ...list,
    ]);
  }

  setValue(int value) {
    print('Задаем $value');
    state = state.copyWith(pageIndex: value);
    print('Задали $value');
  }

  clear() {
    state = CounterState(pageIndex: 0, list: []);
  }

  CounterState get value => state;
}
