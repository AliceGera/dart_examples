void sort(List<int> arr, int left, int right) {
  int pivot; // разрешающий элемент
  int lHold = left;
  int rHold = right;
  pivot = arr[left];
  while (left < right)
  {
    // сдвигаем правую границу пока элемент [right] больше [pivot]
    while ((arr[right] >= pivot) && (left < right)) right--;

    if (left != right) // если границы не сомкнулись
    {
      arr[left] = arr[right]; // перемещаем элемент [right] на место разрешающего
      left++; // сдвигаем левую границу вправо
    }
    // сдвигаем левую границу пока элемент [left] меньше [pivot]
    while ((arr[left] <= pivot) && (left < right)) left++;

    if (left != right) // если границы не сомкнулись
    {
      arr[right] = arr[left]; // перемещаем элемент [left] на место [right]
      right--; // сдвигаем правую границу влево
    }
  }
  arr[left] = pivot; // ставим разрешающий элемент на место
  pivot = left;
  left = lHold;
  right = rHold;

  if (left < pivot) {
    // Рекурсивно вызываем сортировку
    sort(arr, left, pivot - 1);
  }
  if (right > pivot) {
    sort(arr, pivot + 1, right);
  }
}
