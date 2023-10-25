import 'package:cli/OOP/association.dart';
import 'package:cli/OOP/oop.dart';
import 'package:cli/SOLID/dependency_inversion_principle.dart';
import 'package:cli/algorithms/knapsack_problem.dart';
import 'package:cli/algorithms/linked_list.dart';
import 'package:cli/algorithms/linked_list_with_dart_help.dart';
import 'package:cli/algorithms/quick_sort.dart';
import 'package:cli/design_patterns/behavior/observer.dart';
import 'dart:collection';
import 'dart:math' as math;

import 'package:cli/design_patterns/behavior/state.dart';
import 'package:cli/design_patterns/creational/builder.dart';
import 'package:cli/design_patterns/creational/factory_method.dart';
import 'package:cli/design_patterns/structural/decorator.dart';
import 'package:cli/future/future.dart';
import 'package:cli/nullSafety/nullSafety.dart';

Future<void> main() async {
  /////////////////////////////////////////////////////////
  //////////////////////// О О П //////////////////////////
  FrontEndDeveloper frontEndDeveloper = FrontEndDeveloper('Maks');
  //frontEndDeveloper._name=''; невозможно
  frontEndDeveloper.writeCode();

  //Агрегация
  EngineAggregation engineAggregation = EngineAggregation(300);
  CarAggregation carBMW = CarAggregation(engineAggregation);
  print(carBMW);
  //Композиция
  CarComposition carCadillac = CarComposition();
  print(carCadillac);

  ///////////////////////////////////////////////////////////
  ///////////////////////  S O L I D  ///////////////////////
  //dependency inversion
  //YandexMusicApi api=YandexMusicApi();
  //api.get();
  //затем начинаем работать с SpotifyApi
  SpotifyApi api = SpotifyApi(); // нам необходимо менять и создание класса
  api.findAll(); // и вызов соотв им методов

  MusicApi apiDIP = MusicClient(YandexMusicApiDIP());
  apiDIP.getTracks();
  //можем изменить поведение и сделать это только в одном месте

  /////////////////////////////////////////////////////////////////////
  ////////////////////////  S O R T S   ///////////////////////////////

  /////// QUICK SORT ///////
  print('QUICK SORT');
  List<int> arr = [3, 0, 1, 8, 7, 2, 5, 4, 9, 6];
  print('without sort:');
  print(arr);
  sort(arr, 0, 9);
  print('sorted:');
  print(arr);

  ///// KNAPSACK PROBLEM /////
  print('KNAPSACK PROBLEM');
  List<int> weights = [3, 4, 5, 8, 9];
  List<int> prices = [1, 6, 4, 7, 6];
  int count = weights.length;
  int N = 13;
  final A = List.generate(count + 1, (counter) => List.generate(N + 1, (counter) => 0));
  //составляем таблицу стоимости
  for (int k = 0; k <= count; k++) {
    for (int s = 0; s <= N; s++) {
      if (k == 0 || s == 0) {
        A[k][s] = 0; //если размер набора =0 или размер рюкзака =0
      } else {
        if (s >= weights[k - 1]) {
          //если размер рюкзака >= размера текущего предмета,
          // то max стоимость набора
          A[k][s] = math.max(A[k - 1][s], A[k - 1][s - weights[k - 1]] + prices[k - 1]);
          //рассм 2 случая когда предмет кладется и не кладется в рюкзак
        } else {
          A[k][s] = A[k - 1][s];
          //предмет в рюкзак не влезет
        }
      }
    }
  }
  for (int i = 0; i < A.length; i++) {
    print(A[i]);
  }
  List<int> result = [];
  traceResult(A, weights, count, N, result);
  print("Оптимальное содержимое рюкзака: $result");

  ////////// LINKED LIST ///////////
  final linkedListDart = LinkedList<EntryItem>();
  linkedListDart.addAll([
    EntryItem(1, 'A'),
    EntryItem(2, 'B'),
    EntryItem(3, 'C'),
  ]);
  print(linkedListDart.first); // 1 : A
  print(linkedListDart.last); // 3 : C

  linkedListDart.first.insertAfter(EntryItem(15, 'E'));
  linkedListDart.last.insertBefore(EntryItem(10, 'D'));

  for (var entry in linkedListDart) {
    print(entry);
  }
  // 1 : A
  // 15 : E
  // 2 : B
  // 10 : D
  // 3 : C
  linkedListDart.elementAt(2).unlink();
  print(linkedListDart); // (1 : A, 15 : E, 10 : D, 3 : C)
  linkedListDart.first.unlink();
  print(linkedListDart); // (15 : E, 10 : D, 3 : C)
  linkedListDart.remove(linkedListDart.last);
  print(linkedListDart); // (15 : E, 10 : D)
  linkedListDart.clear();
  print(linkedListDart.length); // 0
  print(linkedListDart.isEmpty);

  //////////////////// Custom Linked List //////////////////

  final linkedList = CustomLinkedList<int>();

  linkedList.add(5);
  linkedList.add(10);
  linkedList.add(15);
  linkedList.add(25);
  linkedList.add(35);

  linkedList.printList(); //5 10 15

  linkedList.remove(25);

  linkedList.printList();
  /////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////// DESIGN PATTERNS ////////////////////////////////////////

  //factory
  final deliveryByTruck = Delivery(DeliveryType.truck);
  final deliveryByShip = Delivery(DeliveryType.ship);
  deliveryByTruck.delivery();
  deliveryByShip.delivery();

  //builder
  var pizzaBuilder = PizzaBuilder();
  pizzaBuilder.crust = "gold plated";
  pizzaBuilder.diameter = 30;
  pizzaBuilder.toppings = {"anchovies", "caviar", "diamonds"};
  var luxuriousPizza = pizzaBuilder.build();
  print("Wow! $luxuriousPizza");
  assert(luxuriousPizza.toString() == "A delicious 30\n pizza with gold plated crust covered in anchovies, caviar, diamonds, and cheese");

  //decorator
  final square = Square();
  print(square.draw());
  final greenSquare = GreenShapeDecorator(square);
  print(greenSquare.draw());
  final blueGreenSquare = BlueShapeDecorator(greenSquare);
  print(blueGreenSquare.draw());

  //observer
  var personAlice = Observer("Alice");
  var barista = CoffeeMaker(List.from([personAlice]));
  var personKate = Observer("Kate");
  barista.registerObserver(personKate);
  barista.brew();

  //state
  var lightSwitch = Stateful(StatusOff());
  print("The light switch is ${lightSwitch.state}.");
  print("Toggling the light switch");
  lightSwitch.touch();
  print("The light switch is ${lightSwitch.state}.");

  /////////////////////////  F U T U R E  ////////////////////////
  ////////////////////////////////////////////////////////////////
  //Может работать с async/await и then синтаксисом
  methodA();
  await methodB();
  await methodC('main');
  methodD();
  //Ожидание, выполнено успешно, выполнено с ошибкой
  //Знает, в каких состояниях может находиться Future
  //и показал обработку каждого из них в коде.
  //Ожидание, выполнено успешно, выполнено с ошибкой
  await printOrderMessage();

  /////////////////////////////////////////////////////////////////
  ///////////////////// n u l l   S a f e t y /////////////////////
  // ?
  String? name;
  print(name);
  name = "Tom";
  print(name);
  // !
  int? a = 23;
  int b = a!; // мы уверены, что a не равна null
  print(b);
  //??
  int? number1 = 23;
  int number2 = number1 ?? 0;
  print(number2);        // 23

  number1 = null;
  number2 = number1 ?? 0;
  print(number2);        // 0
  // ?.
  name=null;
  print(name?.toUpperCase());
  // вызов метода у nullable типа не работает
  // поэтому нужно добавить ?
  // !
  print(name!.toUpperCase()); //exs
  // дженерики
  var box = Box<int?>.full(null);
  print(box.unbox());
  //map
  var map = {'key': 'value'};
  print(map['key']!.length); // OK.
  // Using null safety, incorrectly:
  //print(map['key'].length); // Error.


}
