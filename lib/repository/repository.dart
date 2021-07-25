class Repository {
  int _count = 0;

  Future<int> increaseCount() async {
    await Future.delayed(Duration(seconds: 3));
    _count = _count + 1;
    return Future.value(_count);
  }

  Future<int> decreaseCount() async {
    await Future.delayed(Duration(seconds: 3));
    return Future.error('An error has occurred!');
  }
}