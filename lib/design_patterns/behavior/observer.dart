class Notification {
  String message;
  late DateTime timeStamp;
  Notification(this.message, this.timeStamp);
  Notification.forNow(this.message) {
    timeStamp = DateTime.now();
  }
}

class Observable {
  late List<Observer> _observers;

  Observable([List<Observer>? observers]) {
    _observers = observers ?? [];
  }

  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  void notifyObservers(Notification notification) {
    for (var observer in _observers) {
      observer.notify(notification);
    }
  }
}

class Observer {
  String name;

  Observer(this.name);

  void notify(Notification notification) {
    print("[${notification.timeStamp.toIso8601String()}] Hey $name, ${notification.message}!");
  }
}

class CoffeeMaker extends Observable {
  CoffeeMaker([List<Observer>? observers]) : super(observers);
  void brew() {
    print("Brewing the coffee...");
    notifyObservers(Notification.forNow("coffee's done"));
  }
}