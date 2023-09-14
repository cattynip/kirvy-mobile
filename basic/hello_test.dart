void main() {
  print("the main function is required.");

  var schoolName = "Bodwell";
  print(schoolName);
  schoolName = "Albert College";
  print(schoolName);
  final String name = "Seol SO";
  print(name);

  dynamic catName;

  catName = 23;
  catName = "Npm run";

  if (catName is String) {
    catName.trim();
    print(catName.hashCode);
  } else if (catName is int) {
    catName += 2;
  }

  String? isEmptyString = "seol";
  isEmptyString = null;
  isEmptyString?.trimLeft();

  if (isEmptyString != null) isEmpty(isEmptyString);

  late final String myName;
  // print(myName);
  myName = "asdjfkl";
  print(myName);
  // myName = "asdnfklsafjkls";

  /*
   * Const
   * Final
   * Late
   * Type
   * Name
   * Data;
  */

  // sayHelloWithInfo("Seol", 13, "South Korea");
  sayHelloWithInfo(
    name: "Seol",
    age: 13,
    country: "South Korea",
  );
}

List<int> listThing() {
  String name = "Seol SO";
  bool alive = true;
  int age = 23;
  double money = 45.55;

  num x = 23;
  x = 1.1;

  final List<int> numbers = [
    1,
    2,
    3,
    if (alive) 5,
  ];

  numbers.add(4);

  return numbers;
}

String stringInterpolationThing() {
  final String name = "Cattynip";
  final int age = 10;
  final String greeting =
      "Hello everyone, my name is $name, nice to meet you. And I am ${age + 2} years old.";

  return greeting;
}

List<String> collectionForThing() {
  final List<String> oldFriends = ["Seol SO", "Ethan"];
  final List<String> newFriends = [
    ...oldFriends,
    "Cattynip",
    "Who else?",
    for (var friend in oldFriends) "Old: $friend",
  ];

  return newFriends;
}

List<Map> mapsThing() {
  final Map<String, Object> player = {
    'name': 'Seol SO',
    'xp': 2300.3,
    'superpower': false,
    'alive': true,
  };

  final Map<int, bool> something = {
    1: false,
    2: false,
    3: true,
    4: false,
  };

  final Map<List<int>, bool> somethingWeirder = {
    [2, 3, 4]: true,
  };

  return [
    player,
    something,
    somethingWeirder,
  ];
}

Set<int> setsThing() {
  // It tries to make sure that every single element in that variable is unique.
  final Set<int> numbers = {1, 2, 3};

  numbers.add(2);
  numbers.add(2);
  numbers.add(2);
  numbers.add(2);
  numbers.add(2);
  numbers.add(2);
  numbers.add(2);

  return numbers;
}

int plus(int a, int b) {
  final int returnedValue = a + b;

  return returnedValue;
}

String sayHello(String name, [String? country]) =>
    "Hello $name, nice to meet you. And you are from $country";

String sayHelloWithInfo({
  required String name,
  int? age,
  String country = "Japan",
}) {
  String? myName;

  myName ??= "sadjfklafjklsadjf";

  sayHello("Seol");

  return "Hello, $name. I am assuming that you are $age years old and from $country, right?";
}

String capitalizeName(String? name) => name?.toUpperCase() ?? "ANON";

typedef ListOfInts = List<int>;

ListOfInts reverseListOfNumbers(ListOfInts list) {
  final List<int> reversedList = list.reversed.toList();

  return reversedList;
}

// It DOES work, but we can not define the shape of it.
// `typedef` is our tiny friend.
typedef UserInfo = Map<String, String>;
String sayHi(UserInfo userInfo) {
  return "Hi $userInfo['name']";
}

bool isEmpty(String string) => string.length == 0;
