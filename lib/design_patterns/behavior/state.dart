abstract class State {
  void handler(Stateful context);
  String toString();
}

class StatusOn implements State {
  @override
  handler(Stateful context) {
    print("Handler of StatusOn is being called!");
    context.state = StatusOff();
  }

  @override String toString() {
    return "on";
  }
}

class StatusOff implements State {
  @override
  handler(Stateful context) {
    print("Handler of StatusOff is being called!");
    context.state = StatusOn();
  }

  @override String toString() {
    return "off";
  }
}

class Stateful {
  State _state;

  Stateful(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void touch() {
    print("Touching the Stateful...");
    _state.handler(this);
  }
}
