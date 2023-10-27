class SecuritySystem {
  void enable() => print("SecuritySystem enabled");
  void disable() => print("SecuritySystem disabled");
}

class Intercom {
  void on()  => print("Intercom ready");
  void off() => print("Intercom standing by");
}

class WindowShades {
  void open() => print("WindowShades open");
  void close() => print("WindowShades closed");
}

class Lights {
  void on() => print("Lights on");
  void off() => print("Lights off");
}
class SmartHome {
  final SecuritySystem _securitySystem = SecuritySystem();
  final Intercom _intercom = Intercom();
  final WindowShades _windowShades = WindowShades();
  final Lights _lights = Lights();

  void home() {
    _securitySystem.disable();
    _intercom.on();
    _windowShades.open();
    _lights.on();
  }

  void out() {
    _securitySystem.enable();
    _intercom.off();
    _windowShades.close();
    _lights.off();
  }
}