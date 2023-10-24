class Node<T> {
  T? value;
  Node<T>? next;

  Node(this.value);
}


class CustomLinkedList<T> {
  Node<T>? node;

  CustomLinkedList();

  bool get isEmpty => node == null;

  // Добавить новый узел в конец списка
  void add(T value) {
    final newNode = Node<T>(value);
    if (isEmpty) {
      // Если список пуст, установливаем новый узел в качестве главного
      node = newNode;
    } else {
      var current = node;
      while (current!.next != null) {
        //проходимся по списку чтобы найти последний узел
        current = current.next;
      }
      // Устанавливаем новый узел после последнего
      current.next = newNode;
    }
  }

  // удалить первый узел с заданным значением
  void remove(T value) {
    if (isEmpty) return;

    if (node!.value == value) {
      node = node?.next;
      return;
    }
    //5 10 15 25 30
    //хотим удалить 25
    var current = node; //=5
    while (current!.next != null) { //10  //15 // 25
      if (current.next!.value == value) { //25==25
        current.next = current.next?.next; //=30
        return;
      }
      current = current.next; //=10 //15
    }
  }

  void printList() {
    var current = node;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}