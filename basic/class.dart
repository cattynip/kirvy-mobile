class Strong {
  final double strengthLevel = 150000.99;
}

class Quick {
  void runQuick() {
    print("I am runnig");
  }
}

abstract class Human {
  final String name;

  Human(this.name);

  void sayHello() {
    print("Hi! My name is $name");
  }

  void walk();

  void running();
}

enum Team { red, blue, green }

class Player extends Human {
  late int xp, age;
  late final Team team;

  // Named constructor
  Player({
    required String name,
    required this.team,
    required this.age,
    required this.xp,
  }) : super(name);

  // Named constructor
  Player.createBluePlayer({
    required String name,
    required int age,
    this.xp = 0,
    this.team = Team.blue,
  }) : super(name);

  // Optional constructor
  Player.createRedPlayer(this.age, [this.team = Team.red, this.xp = 0])
      : super("I dunno");

  @override
  void sayHello() {
    print("Hello, I am $name, and working for $team");
    super.sayHello();
  }

  void changeTeamTo(Team changeToTeam) {
    team = changeToTeam;
  }

  void walk() {
    print("I am walking.");
  }

  void running() {
    print("Hello ther, I am running");
  }
}

List<Player> classFunction() {
  final Player player = Player(
    name: 'Seol',
    age: 20,
    team: Team.green,
    xp: 200,
  )
    ..xp += 500
    ..age += 1
    ..changeTeamTo(Team.blue);

  final Player bluePlayer = Player.createBluePlayer(
    name: 'Cattynip',
    age: 29,
  )
    ..walk()
    ..running();

  var potato = bluePlayer
    ..xp -= 3000
    ..age += 4;

  final Player redPlayer = Player.createRedPlayer(200)
    ..xp *= 400
    ..age -= 4
    ..sayHello();

  return [player, potato, bluePlayer, redPlayer];
}
