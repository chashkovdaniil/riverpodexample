import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    useEffect(() {
      ref.read(managerProvider).init();
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: ListCounter(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              ref.read(managerProvider).clear();
            },
            icon: Icon(Icons.clear),
          ),
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

class ListCounter extends ConsumerStatefulWidget {
  const ListCounter({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ListCounterState();
  }
}

class _ListCounterState extends ConsumerState<ListCounter> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final state = ref.watch(stateProvider);
    final list = state.list;

    return ListView.builder(
      itemCount: list.length,
      controller: controller,
      itemBuilder: (context, index) {
        return ListTile(title: Text(index.toString()));
      },
    );
  }

  _scrollListener() {
    if (controller.position.extentAfter < 500) {
      ref.read(managerProvider).getData();
    }
  }
}
