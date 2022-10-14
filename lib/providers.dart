import 'package:riverpod/riverpod.dart';
import 'package:riverpodexample/api.dart';
import 'package:riverpodexample/manager.dart';

import 'model.dart';
import 'state_provider.dart';

final managerProvider = Provider((ref) => CounterManager(
      ref.watch(apiProvider),
      ref.watch(stateProvider.notifier),
    ));
final apiProvider = Provider((_) => Api());
final stateProvider = StateNotifierProvider<CounterStateProvider, CounterState>(
  (_) => CounterStateProvider(),
);
