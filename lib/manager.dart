import 'package:riverpodexample/state_provider.dart';

import 'api.dart';

class CounterManager {
  final Api api;
  final CounterStateProvider stateProvider;

  CounterManager(this.api, this.stateProvider);

  init() {
    getData();
  }

  getData() async {
    // Получили данные из апи
    print('Принимаем данные из апи');
    final list = await api.getDataByPage(stateProvider.value.pageIndex);

    // Добавляем данные к существующему списку
    stateProvider.appendToList(list);
    print('Приняли данные');
  }

  sendData() async {
    print('Отправка данные');
    final data = stateProvider.value;
    await api.send(data.pageIndex);
    print('Отправили данные');
    // отправили данные
  }

  increment() {
    stateProvider.increment();
    getData();
  }

  decrement() => stateProvider.decrement();

  clear() => stateProvider.clear();
}
