Stream<int> getStream() async* {
  for (var i = 0; i < 5; i++) {
    yield i;
    if (i == 2 || i == 3) {
      yield* Stream.error('Custom error at index $i');
    }
  }
}