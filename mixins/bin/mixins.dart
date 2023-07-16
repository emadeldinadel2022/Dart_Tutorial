import 'dart:mirrors';
import 'package:uuid/uuid.dart';


void main(List<String> args) {
  final person = Person();
  person.walk(speed: 10.0);
  person.jump(speed: 20.0);

  //mixins and functions parameters
  print("===================================");
  final person2 = Person2(firstName: "John", lastName: "Doe");
  print(person2.fullName);
  print(getFullName(person2));

  //mixins and logic 
  print("===================================");
  final whiskers = Cat(age: 2);
  print(whiskers.age);
  whiskers.incrementAge();
  print(whiskers.age);

  //limiting mixins to data types
  print("===================================");
  //final obj = Has2Feet();
  //!obj.run(); we have no run 
  final human = Human();
  human.run();

  //mixins and hashcode
  print("===================================");
  final cats = <Cats>{
    Cats(name: "Whiskers", age: 2),
    Cats(name: "Felix", age: 4),
    Cats(name: "Garfield", age: 3),
  };
  cats.forEach(print);

  //mixins and reflection
  print("===================================");
  final employee = Employee(name: "John", age: 30);
  print(employee);
  final house = House(address: "123 Main St", rooms: 3);
  print(house);

  //mixins and equality
  print("===================================");
  final uuid1 = const Uuid().v4();
  final uuid2 = const Uuid().v4();
  final shirt1 = Shirt(id: uuid1, color: "Red", size: 40);
  final shirt1Again = Shirt(id: uuid1, color: "red", size: 40);
  final shirt2 = Shirt(id: uuid2, color: "Red", size: 40);

  if (shirt1 == shirt2){
    print("Shirts are the same");
  }else{
    print("Shirts are different");
  }

  if (shirt1 == shirt1Again){
    print("Shirts are the same");
  }else{
    print("Shirts are different");
  }

  if (shirt2 == shirt1Again){
    print("Shirts are the same");
  }else{
    print("Shirts are different");
  }  

}
  
//HasFullName is a mixin that bring with it the others mixins
String getFullName(HasFullName obj) => obj.fullName;

mixin HasSpeed{
  abstract double speed;
}

mixin CanJump on HasSpeed{//yoy can not bring canjump without haspeed
  void jump({
    required double speed
    }){
    print("Jumping with speed $speed");
    this.speed = speed;
  }
}

mixin CanWalk on HasSpeed{
  void walk({
    required double speed
    }){
    print("Walking with speed $speed");
    this.speed = speed;
  }
}

class Person with HasSpeed, CanWalk, CanJump{
  @override
  double speed;

  Person() : speed = 0.0;
}

mixin HasFirstName{
  String get firstName;
}

mixin HasLastName{
  String get lastName;
}

mixin HasFullName on HasFirstName, HasLastName{
  String get fullName => "$firstName $lastName";
}

class Person2 with HasFirstName, HasLastName, HasFullName{
  @override
  final String firstName;

  @override
  final String lastName;

    Person2({required this.firstName, required this.lastName});
}

mixin HasAge{
  abstract int age;

  void incrementAge() => age++;
}

class Cat with HasAge{
  @override
  int age = 0;

  Cat({required this.age});
}

class Has2Feet{
  const Has2Feet();
}

class Human extends Has2Feet with CanRun{
  const Human();
}

mixin CanRun on Has2Feet{
  void run(){
    print("Running");
  }
}

class HasNoFeet{
  const HasNoFeet();
}

class Fish extends HasNoFeet {
  const Fish();
}

enum PetType{
  cat,
  dog,
  fish
}

mixin Pet {
  String get name;
  int get age;
  PetType get type;

  @override
  String toString() => "Pet($type): name: $name, age: $age";

  @override
  int get hashCode => Object.hash(name, age, type);//when we have access to these properties, we chan calculate the hashcode of them

  @override
  bool operator ==(Object other) => other is Pet && other.hashCode == hashCode;
}

class Cats with Pet{
  @override
  final String name;

  @override
  final int age;

  @override
  final PetType type;

  Cats({required this.name, required this.age}) : type = PetType.cat;
}

class Employee with HasDescription{
  final String name;
  final int age;

  Employee({required this.name, required this.age});
}

class House with HasDescription{
  final String address;
  final int rooms;

  House({required this.address, required this.rooms});
}

mixin HasDescription{
  @override
  String toString() {
    final reflection = reflect(this);
    final thisType = MirrorSystem.getName(reflection.type.simpleName);//give us the name of the class
    final fields = reflection.type.declarations.values.whereType<VariableMirror>();//give us the fields of the class
    final properties = <String, dynamic>{
      for (final field in fields)
        field.asKey: reflection.getField(field.simpleName).reflectee
    }.toString();

    return "$thisType($properties)";
  }
  
}

extension AsKey on VariableMirror{
  String get asKey{
    final fieldName = MirrorSystem.getName(simpleName);
    final fieldType = MirrorSystem.getName(type.simpleName);
    return "$fieldType $fieldName";
  }
}

mixin HasIdentifier {
  String get id;

  @override
  bool operator ==(Object other) => 
    identical(this, other) || //if the current data type that is implementing HasIdentifier, 
    //other type when we compare with is the same as the other
    //has the same memory space (they are residing in the same place in the memory) then they are same object
    other is HasIdentifier && //otherwise the data type compared to has to be the same data type
      runtimeType == other.runtimeType && //the runtime type has to be the same
      id == other.id;//and the id has to be the same
}

class Shirt with HasIdentifier{
  @override
  final String id;

  final String color;
  final int size;

  Shirt({required this.id, required this.color, required this.size});
}
