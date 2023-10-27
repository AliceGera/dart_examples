//ООП
abstract class Developer {
  void writeCode();
}

class FrontEndDeveloper extends Developer {
  String _name = '';

  FrontEndDeveloper(String name) {
    _name = name;
  }

  @override
  void writeCode() {
    print('FrontEnd developer $_name use js');
  }
}

class FlutterDeveloper extends Developer {
  @override
  void writeCode() {
    print('use dart');
  }
}

class IosDeveloper extends Developer {
  @override
  void writeCode() {
    print('use swift');
  }
}
