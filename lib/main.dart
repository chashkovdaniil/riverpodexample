import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodexample/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Center(
        child: TextCounter(),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              ref.read(managerProvider).increment();
            },
            icon: Icon(Icons.plus_one),
          ),
          IconButton(
            onPressed: () {
              ref.read(managerProvider).decrement();
            },
            icon: Icon(Icons.exposure_minus_1),
          ),
          TextButton.icon(
            onPressed: () {
              ref.read(managerProvider).getData();
            },
            icon: Icon(Icons.get_app),
            label: Text('Загрузить данные'),
          ),
          TextButton.icon(
            onPressed: () {
              ref.read(managerProvider).sendData();
            },
            icon: Icon(Icons.send),
            label: Text('Отправить данные'),
          ),
        ],
      ),
    );
  }
}

class TextCounter extends ConsumerWidget {
  const TextCounter({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(stateProvider);
    return Text(state.counterValue.toString());
  }
}
