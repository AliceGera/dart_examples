abstract class Class {
  method1();

  method2();

  method3();
}

class Class1 implements Class {
  @override
  method1() {
    // realisation
  }

  @override
  method2() {
    // realisation
  }

//не нужен метод
  @override
  method3() {
    throw Error();
  }
}

class Class2 implements Class {
  @override
  method1() {
    // realisation
  }

//не нужен метод
  @override
  method2() {
    throw Error();
  }

  @override
  method3() {
    // realisation
  }
}

class Class3 implements Class {
  //не нужен метод
  @override
  method1() {
    throw Error();
  }

  @override
  method2() {
    // realisation
  }

  @override
  method3() {
    // realisation
  }
}

///////////////////////
////ISP
///////////////////////

abstract class ClassMethod1 {
  method1();
}

abstract class ClassMethod2 {
  method2();
}

abstract class ClassMethod3 {
  method3();
}

class Class1ISP implements ClassMethod1, ClassMethod2 {
  @override
  method1() {
    // realisation
  }

  @override
  method2() {
    // realisation
  }
}

class Class2ISP implements ClassMethod2, ClassMethod3 {
  @override
  method2() {
    // realisation
  }

  @override
  method3() {
    // realisation
  }
}

class Class3ISP implements ClassMethod1, ClassMethod3 {
  @override
  method1() {
    // realisation
  }

  @override
  method3() {
    // realisation
  }
}
