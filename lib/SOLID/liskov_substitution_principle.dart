abstract class Class {
  void method1();

  void method2();

  void method3();
}

class Class1 implements Class {
  @override
  void method1() {}

  @override
  void method2() {}

  @override
  void method3() {
    throw Error();
    // нам не нужен этот метод в классе
    // поведение наследуемых классов не должно противоречить поведению,
    // заданному базовым классом
  }
}

class Class2 implements Class {
  @override
  void method1() {}

  @override
  void method2() {}

  @override
  void method3() {}
}

/////////////////////////
//OCP
////////////////////////
abstract class ClassOCP {
  void method1();

  void method2();

//удаляем метод, котрый не актуален для двух наследуемых  классов
//void method3();
}

class ClassOCP1 implements ClassOCP {
  @override
  void method1() {}

  @override
  void method2() {}
}

class ClassOCP2 implements ClassOCP {
  @override
  void method1() {}

  @override
  void method2() {}

  void method3() {}
}
