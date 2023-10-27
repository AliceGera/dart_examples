import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:cli/rest_api/rest_api.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:cli/streame/streame.dart';
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
  print(number2); // 23

  number1 = null;
  number2 = number1 ?? 0;
  print(number2); // 0
  // ?.
  name = null;
  print(name?.toUpperCase());
  // вызов метода у nullable типа не работает
  // поэтому нужно добавить ?
  // !
  // print(name!.toUpperCase()); //exs
  // дженерики
  var box = Box<int?>.full(null);
  print(box.unbox());
  //map
  var map = {'key': 'value'};
  print('map[' ']!.length');
  print(map['key']!.length); // OK.
  // Using null safety, incorrectly:
  //print(map['key'].length); // Error.

  ////////////////////////////////////////////////////////////
  /////////////// C O L L E C T I O N S //////////////////////

  //L I S T
  List<String> list1 = [];
  List<int> list2 = [1, 3, 4, 2];
  final fixedLengthList = List<int>.filled(5, 0); // Creates fixed-length list.
  print(fixedLengthList); // [0, 0, 0, 0, 0]
  fixedLengthList[0] = 87;
  fixedLengthList.setAll(1, [1, 2, 3]);
  print(fixedLengthList); // [87, 1, 2, 3, 0]
  final growableList = <String>['A', 'B'];
  growableList[0] = 'G';
  print(growableList); // [G, B]
  growableList.add('X');
  growableList.addAll({'C', 'B'});
  print(growableList); // [G, B, X, C, B]
  ////////////constructors
  //empty
  final growableListEmpty = List.empty(growable: true); // []
  growableListEmpty.add(1); // [1]
  final fixedLengthListEmpty = List.empty(growable: false);
  //fixedLengthListEmpty.add(1); // error
  //filled
  final zeroList = List<int>.filled(3, 0, growable: true); // [0, 0, 0]
  final shared = List.filled(3, []);
  shared[0].add(499);
  print(shared); // [[499], [499], [499]]
  final unique = List.generate(3, (_) => []);
  unique[0].add(499);
  print(unique); // [[499], [], []]
  //from
  final numbers = <num>[1, 2, 3];
  final listFrom = List<int>.from(numbers);
  print(listFrom); // [1, 2, 3]
  const jsonArray = '''
  [{"text": "foo", "value": 1, "status": true},
   {"text": "bar", "value": 2, "status": false}]
   ''';
  final List<dynamic> dynamicList = jsonDecode(jsonArray);
  final List<Map<String, dynamic>> fooData = List.from(dynamicList.where((x) => x is Map && x['text'] == 'foo'));
  print(fooData);
  //generate
  final growableListGenerate = List<int>.generate(3, (int index) => index * index, growable: true);
  print(growableListGenerate); // [0, 1, 4]
  final fixedLengthListGenerate = List<int>.generate(3, (int index) => index * index, growable: false);
  print(fixedLengthListGenerate); // [0, 1, 4]
  //of
  final numbersOf = <int>[1, 2, 3];
  final listOf = List<num>.of(numbersOf);
  print(listOf); // [1, 2, 3]
  //unmodifiable
  final numbersUnmodifiable = <int>[1, 2, 3];
  final unmodifiableList = List.unmodifiable(numbersUnmodifiable); // [1, 2, 3]
  //unmodifiableList[1] = 87; // error.

  // M A P
  Map<int, String> map1 = {};
  var map2 = <int, String>{};
  var map3 = {};
  var map5 = {1: "Tom", 2: "Bob", 3: "Sam"};
  ////////////constructors
  //from
  final planets = <num, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth', 4: 'Mars'};
  final mapFrom = Map<int, String>.from(planets);
  //fromEntries
  final moonCount = <String, int>{
    'Mercury': 0,
    'Venus': 0,
    'Earth': 1,
    'Mars': 2,
    'Jupiter': 79,
    'Saturn': 82,
    'Uranus': 27,
    'Neptune': 14,
  };
  final mapFromEntries = Map.fromEntries(moonCount.entries);
  //fromIterable
  final numbersFromIterable = <int>[1, 2, 3];
  final mapFromIterable = Map<String, int>.fromIterable(numbersFromIterable, key: (item) => item.toString(), value: (item) => item * item);
  print(mapFromIterable); // {1: 1, 2: 4, 3: 9}
  //fromIterables
  final rings = <bool>[false, false, true, true];
  final planetsFromIterables = <String>{'Earth', 'Mars', 'Jupiter', 'Saturn'};
  final mapFromIterables = Map<String, bool>.fromIterables(planetsFromIterables, rings);
  print(mapFromIterables); // {Earth: false, Mars: false, Jupiter: true, Saturn: true}
  //of
  final planetsOf = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
  final mapOf = Map<num, String>.of(planetsOf);
  print(mapOf); // {1: Mercury, 2: Venus, 3: Earth}
  //unmodifiable
  final planetsUnmodifiable = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
  final unmodifiableMap = Map.unmodifiable(planetsUnmodifiable);
  // unmodifiableMap[4] = 'Mars'; error

  // S E T
  final planets1 = <String>{}; // LinkedHashSet
  final copySet = planets1.toSet();
  ////////////constructors
  //from
  final numbersFrom = <num>{10, 20, 30};
  final setFrom = Set<int>.from(numbersFrom); //{10, 20, 30}
  //of
  final baseSet = <int>{1, 2, 3};
  final setOf = Set<num>.of(baseSet); //{1, 2, 3}
  //unmodifiable
  final characters = <String>{'A', 'B', 'C'};
  final unmodifiableSet = Set.unmodifiable(characters); //{'A', 'B', 'C'}

  final List<String> listString = ["1", "2"];
  final List<int> newList = listString.map((e) => int.parse(e)).toList();
  //В примере, использовав один метод, отфильтровал значения, опираясь на предикат
  // (например, из списка List<int> получить только чётные числа).
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  list.removeWhere((item) => item % 2 != 0);
  print(list);
  //В примере, использовав один метод,
  //проверил существует ли определённый элемент внутри коллекции.
  bool isContains = unmodifiableSet.contains('A');
  print(isContains);

//В примере использовал операторы spread ("..."),
// control flow и циклы внутри коллекций.
  var mapFirst = {'a': 'apple', 'b': 'banana'};
  var mapSecond = {'c': 'cherry', 'd': 'date'};
  var combinedMap = {...mapFirst, ...mapSecond};
  print("combinedMap");
  print(combinedMap);

///////////////////// S T R E A M ////////////////////////

  var stream = getStream();
  stream.listen((event) => print('Data: $event'),
      onDone: () => print('Done'), onError: (err) => print('Error: $err'));

  var controller1 = StreamController<int>.broadcast();
  controller1.stream.listen(print);
  controller1.sink.add(1);
  controller1.stream.listen(print);

  var controller2 = (StreamController<int>()..add(2)).stream;
  controller2.listen(print);
  //////////////////////////////////////////////////////
//////////////////  R E S T   A P I  /////////////////

  var url = Uri.parse('https://eightballapi.com/api/');
  print(url);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    var reading = jsonResponse['reading'];
    print('the answer: $reading.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }

  Dio dio = Dio();
  dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  dio.options.responseType = ResponseType.json;
  final newPost = await dio.post(
    '/posts',
    data: {
      "title": 'foo1',
      "body": 'bar212',
      "userId": 12,
    },
  );
  print('Dio post');
  print(newPost);

  final post1 = await dio.get('/posts/2');
  print('Передал параметры/данные через url');
  print(post1);

  final post2 = await dio.get(
    '/posts',
    queryParameters: {'id': 2},
  );
  print('Передал параметры/данные через queryParameters');
  print(post2);

  const data = {'text': 'foo', 'value': 2, 'status': false, 'extra': null};
  final String jsonString = jsonEncode(data);
  print(jsonString); // {"text":"foo","value":2,"status":false,"extra":null}

  final CustomClass cc = CustomClass(text: 'Dart', value: 123);
  final jsonText = jsonEncode({'cc': cc},
      toEncodable: (Object? value) => value is CustomClass ? CustomClass.toJson(value) : throw UnsupportedError('Cannot convert to JSON: $value'));
  print(jsonText); // {"cc":{"text":"Dart","value":123}}

}
