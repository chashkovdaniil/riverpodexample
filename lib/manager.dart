import 'package:riverpodexample/state_provider.dart';

import 'api.dart';

class CounterManager {
  final Api api;
  final CounterStateProvider stateProvider;

  CounterManager(this.api, this.stateProvider);

  getData() async {
    // Получили данные из апи
    print('Принимаем данные из апи');
    final data = await api.get();

    stateProvider.setValue(data);
    print('Приняли данные');
  }

  sendData() async {
    print('Отправка данные');
    final data = stateProvider.value;
    await api.send(data.counterValue);
    print('Отправили данные');
    // отправили данные
  }

  increment() => stateProvider.increment();
  decrement() => stateProvider.decrement();
}
