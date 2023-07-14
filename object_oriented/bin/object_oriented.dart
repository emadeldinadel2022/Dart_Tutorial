void main(List<String> arguments) {
  const p1 = Person(name: 'John', age: 30);
  print(p1);
  print(p1.name);
  print(p1.age);

  // different constructors for every class
  print("====================================");
  const p2 = Person2('John', 30);
  print(p2);
  print(p2.name);
  print(p2.age);

  const p3 = Person2.ali();
  print(p3);
  print(p3.name);
  print(p3.age);

  print("====================================");
  const p4 = Person2.parameterAccept(50);
  print(p4);
  print(p4.name);
  print(p4.age);

  print("====================================");
  const p5 = Person2.optionalConstructor(name: 'John');
  print(p5);
  print(p5.name);
  print(p5.age);

  print("====================================");
  const p6 = Person2.optionalConstructor(age: 50);
  print(p6);
  print(p6.name);
  print(p6.age);

  print("====================================");
  const p7 = Person2.optionalConstructor();
  print(p7);
  print(p7.name);
  print(p7.age);

  print("====================================");
  const p8 = Person2.optionalConstructor(name: 'John', age: 50);
  print(p8);
  print(p8.name);
  print(p8.age);

  print("====================================");
  const v1 = Vehicle(4);
  print(v1);
  print(v1.toString());

  print("====================================");
  const v2 = Car();
  print(v2);
  print(v2.toString());//inherit from parent class Vehicle
  
  print("====================================");
  const v3 = Bicycle();
  print(v3);
  print(v3.toString());//inherit from parent class Vehicle

  print("====================================");
  const p9 = Person3(firstName: 'John', lastName: 'Doe');
  print(p9);
  print(p9.firstName);
  print(p9.lastName);
  print(p9.fullName);

  print("====================================");
  const p10 = Person4(firstName: 'John', lastName: 'Doe');
  print(p10);
  print(p10.firstName);
  print(p10.lastName);
  print(p10.fullName);
  print(p10.fullName);

  print("====================================");
  final c1 = Car2();
  c1.drive(speed: 100);
  print(c1.speed);
  c1.stop();
  print(c1.speed);

  print("====================================");
  final c2 = Car3();
  try{
    c2.drive(speed: 50);
    c2.drive(speed: -100);
  }catch(e){
    print(e);
  }

  print("====================================");
  print(Phone.counter);
  print(Phone._counter);
  Phone(brand: 'Samsung');
  print(Phone.counter);
  print(Phone._counter);
  Phone(brand: 'Apple');
  print(Phone.counter);
  print(Phone._counter);

  //factory constructor
  print("====================================");
  print(Tool());
  print(Tool.hammer());
  print(Tool.screwdriver());

  //inhering constructor
  print("====================================");
  const admin = Admin();
  print(admin.role);
  const moderator = Moderator();
  print(moderator.role);

  //abstract class
  print("====================================");
  const lion = Lion();
  lion.eat();
  lion.sleep();
  print(lion.type);
  const cow = Cow();
  cow.eat();
  cow.sleep();
  print(cow.type);


}

class Person{
  final String name;
  final int age;

  const Person({required this.name, required this.age});
}

class Person2{
  final String name;
  final int age;

  const Person2(this.name, this.age);

  //named constructor
  const Person2.ali() : name = 'Ali', age = 30;

  //parameterized constructor
  const Person2.parameterAccept(this.age) : name = 'Ali';

  //optional constructor 
  const Person2.optionalConstructor({
    String? name,
    int? age,
  }) : name = name ?? 'Ali', age = age ?? 20;
}

class Vehicle{
  final int numberOfWheels;

  const Vehicle(this.numberOfWheels);

  @override
  String toString() {
    return '$runtimeType{numberOfWheels: $numberOfWheels}';
  }
}

class Car extends Vehicle{
  const Car() : super(4);
}

class Bicycle extends Vehicle{
  const Bicycle() : super(2);
}

class Person3{
  final String firstName;
  final String lastName;
  final String fullName;

  const Person3({required this.firstName, required this.lastName}) : fullName = '$firstName $lastName';  
}

class Person4{
  final String firstName;
  final String lastName;
  
  String get fullName {
    print('fullName getter called ');
    return'$firstName $lastName';
  }

  const Person4({required this.firstName, required this.lastName});
  
}

class Car2{
  int speed = 0;

  void drive({
    required int speed
  }){
    this.speed = speed;
    print('Driving at $speed km/h');
  }

  void stop(){
    speed = 0;
    print('Stopping...');
    print('Car stopped');
  }
}

class Car3{
  int _speed = 0;

  int get speed => _speed;

  set speed(int newSpeed){
    if (newSpeed < 0){
      throw ArgumentError('Speed cannot be negative');
    }
    _speed = newSpeed;
  }

  void drive({
    required int speed
  }){
    this.speed = speed;//will going to setter
    print('Driving at $speed km/h');
  }

  void stop(){
    speed = 0;//will going to setter-
    print('Stopping...');
    print('Car stopped');
  }
}

  class Phone{
    final String brand;
    static int _counter = 0;
    //in real world usecase there is no need to counter for instances
    static int get counter => _counter;

    static void increaseCounter(){
      _counter++;
    }

  Phone({
    required this.brand,
  }){
    increaseCounter();
  }
}

class Tool{
  const Tool();

  factory Tool.hammer() => Hammer();
  factory Tool.screwdriver() => Screwdriver();

  @override
  String toString() {
    return 'Tool of type : $runtimeType';
  }
}

class Hammer extends Tool{
  const Hammer();
}

class Screwdriver extends Tool{
  const Screwdriver();
}

enum Role{
  admin,
  moderator,
}

class User{
  final Role role;

  const User({
    required this.role,
  });
}

class Admin extends User{
  const Admin() : super(role: Role.admin);
}

class Moderator extends User{
  const Moderator() : super(role: Role.moderator);
}

abstract class Animal{
  final AnimalType type;

  const Animal({
    required this.type,
  });

  void eat() => print('Eating...');
  void sleep() => print('Sleeping...');
}


class Lion extends Animal{
  const Lion() : super(type: AnimalType.predators);
}

class Cow implements Animal{
  
  const Cow();
  @override
  void eat() => print('Cow is eating grass');

  @override
  void sleep() => print('Cow is sleeping');
  
  @override
  // TODO: implement type
  AnimalType get type => AnimalType.herbivores;
}

enum AnimalType{
  predators,
  herbivores,
}




