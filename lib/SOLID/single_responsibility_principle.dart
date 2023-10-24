class User {
  int? userId;
  String? userName;

  User(int id, String name) {
    userId = id;
    userName = name;
  }
//saveToDatabase() {}
//log() {}
//send() {}
}

class UserRepository {
  void save() {}
}

class UserLogger {
  void log() {}
}

class UserController {
  void send() {}
}
