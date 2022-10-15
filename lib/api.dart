class Api {
  int counter = 10;

  Api._();

  factory Api() => _singleton;
  static final _singleton = Api._();

  send(int value) {
    counter = value;
  }

  Future<int> getCounter() => Future.value(counter);

  Future<List<int>> getDataByPage(int pageIndex) {
    return Future.value(
      List.generate(10, (index) => index * pageIndex),
    );
  }
}
