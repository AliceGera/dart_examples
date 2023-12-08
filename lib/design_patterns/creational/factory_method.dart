enum DeliveryType { truck, ship }

abstract class Delivery {
  factory Delivery(DeliveryType type) {
    switch (type) {
      case DeliveryType.truck:
        return Truck();
      case DeliveryType.ship:
        return Ship();
    }
  }

  void delivery();
}

class Truck implements Delivery {
  @override
  void delivery() {
    print("delivery by truck");
  }
}

class Ship implements Delivery {
  @override
  void delivery() {
    print("delivery by ship");
  }
}
