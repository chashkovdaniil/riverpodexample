class Api {
  int counter = 10;
  Api._();
  factory Api() => _singleton;
  static final _singleton = Api._();

  send(int value) {
    counter = value;
  }

  Future<int> get() => Future.value(counter);
}
