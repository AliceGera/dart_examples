//Композиция
class EngineComposition {
  int? power;

  EngineComposition(this.power);
}

class CarComposition {
  String model = 'BMW';
  EngineComposition? engine;

  CarComposition() {
    engine = EngineComposition(300);
  }
}

//Агрегация
class EngineAggregation {
  int? power;

  EngineAggregation(this.power);
}

class CarAggregation {
  String model = 'Cadillac';
  EngineAggregation? engine;

  CarAggregation(EngineAggregation some) {
    engine = some;
  }
}

