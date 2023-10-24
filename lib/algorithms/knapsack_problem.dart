void traceResult(List<List<int>> A, List<int> weight, int k, int s, List<int> result) {
  if (A[k][s] == 0) {
    return;
  }
  if (A[k - 1][s] == A[k][s]) {
    traceResult(A, weight, k - 1, s, result);
    //k не учавствует
  } else {
    //предмет уч, умееньшаем рюкзак на вес k предмета
    traceResult(A, weight, k - 1, s - weight[k - 1], result);
    result.add(k);
  }
}
