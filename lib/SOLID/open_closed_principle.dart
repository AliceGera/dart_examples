class InterestingPlace {
  String? interestingPlaceDescription;
  String? interestingPlaceType;

  InterestingPlace(String description, String type) {
    interestingPlaceDescription = description;
    interestingPlaceType = type;
  }

  void place() {
    if (interestingPlaceType == 'кафе') {
      print('Место,где можно вкусно покушать $interestingPlaceType');
    }
    if (interestingPlaceType == 'особое место') {
      print('Увлекательное место, если хочется чего-то необычного $interestingPlaceType');
    }
    if (interestingPlaceType == 'парк') {
      print('Если хочнтся провести время на природе $interestingPlaceType ');
    }
    //позже попросят еще добавить изменения
  }
}

//релизация
//OCP - Open closed principle
abstract class InterestingPlaceOCP {
  void place();
}

class PlaceOCP implements InterestingPlaceOCP {
  String? placeDescription;
  String? placeType;

  PlaceOCP(String this.placeDescription, String this.placeType);

  @override
  void place() {}
}

class Park extends PlaceOCP {
  Park(
    super.placeDescription,
    super.placeType,
  );

  @override
  void place() {
    print('Место,где можно вкусно покушать $placeDescription');
  }
}

class SpecialPlace extends PlaceOCP {
  SpecialPlace(
    super.placeDescription,
    super.placeType,
  );

  @override
  void place() {
    print('Увлекательное место, если хочется чего-то необычного $placeDescription');
  }
}
