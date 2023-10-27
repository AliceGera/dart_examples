methodA(){
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  Future((){
    print('C running Future from $from');
  }).then((_){
    print('C end of Future from $from');
  });

  print('C end from $from');
}

methodD(){
  print('D');
}

////
Future<void> printOrderMessage() async {
  try {
    print('Awaiting user order...');
    var order = await fetchUserOrder();
    print(order);
  } catch (err) {
    print('Caught error: $err');
  }
}

Future<String> fetchUserOrder() {
  var str = Future.delayed(
      const Duration(seconds: 4),
          () => throw 'Cannot locate user order');
  return str;
}
Future<int> getFuture() {
  return Future<int>.value(2021);
}
Future<int> getFutureError() {
  return Future.error(Exception('Issue'));
}
