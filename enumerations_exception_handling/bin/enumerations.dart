// Enumerations in Dart
// Enumerations are special classes that represent a group of constants.
// Enumerations are used to represent a fixed number of constants.
// Enumerations are declared using the enum keyword.
//enumerated type (also called enumeration, enum, or factor in the R programming language, and a categorical variable in statistics)
// is a data type consisting of a set of named values called elements, members, enumeral, or enumerators of the type.

void main(List<String> args) {
  final wolf = Animal(name: 'Wolf', type: AnimalType.dog);

  if (wolf.type == AnimalType.dog) {
    print('Wolf is a dog');
  }else{
    print('Wolf is not a dog');
  }

  switch (wolf.type) {//use switch case in enum type, less time consuming and less code than if else if else
    case AnimalType.cat:
      print('Wolf is a cat');
      break;
    case AnimalType.dog:
      print('Wolf is a dog');
      break;
    case AnimalType.bird:
      print('Wolf is a bird');
      break;
    case AnimalType.fish:
      print('Wolf is a fish');
      break;
    default:
      print('Wolf is not an animal');
  }

  if (wolf.type == AnimalType.cat) {
    print('Wolf is a cat');
  }else if(wolf.type == AnimalType.dog){
    print('Wolf is a dog');
  }else if(wolf.type == AnimalType.bird){
    print('Wolf is a bird');
  }else if(wolf.type == AnimalType.fish){
    print('Wolf is a fish');
  }else{
    print('Wolf is not an animal');
  }

  //enhanced enumeration 
  print("====================================");
  final p1 = Person(name: 'John', car: Car.teslaModelX);
  print(p1.car.manufacturer);
  print(p1.car.model);
  print(p1.car.year);
  print(p1.car.toString());
  print(p1.car);
  print(p1.car.index);//index of the enum

  switch (p1.car) {
    case Car.teslaModelX:
      print('p1 has a Tesla Model X');
      break;
    case Car.teslaModelY:
      print('p1 has a Tesla Model Y');
      break;
  }

  //switch Enumerations
  print("====================================");
  final language = ProgrammingLanguages.dart;

  switch (language){
    case ProgrammingLanguages.dart:
      print('Dart is a great language');
      break;
    default://otherwise case for not match, handle your future cases
      print('I know this language is not dart');
  }

  //creating enums from strings
  print("====================================");
  print(AnimalType.values);
  describe(animalType(fromStr: 'cat'));
  describe(animalType(fromStr: 'lion'));//throw error

  //falling through
  print("====================================");
  final vehicle = VehicleType.car;
  switch(vehicle){
    case VehicleType.car:
    case VehicleType.bicycle:
    case VehicleType.motorcycle:
      print('Most common Personal Vehicles');//?do you want to print this for all of the cases, how do you avoid duplicate statements
      break;
    case VehicleType.truck:
      print('Usually used for commercial purposes');
      break;
  //when you handle all cases of enums, default case is not necessary, because it will never be executed
  }

  //another example of falling through using labeling
  print("====================================");
  final animal = Animal(name: 'Cat', type: AnimalType.cat);
  switch(animal.type){
    case AnimalType.cat:
      print('Cat');
      continue dog;
    dog:
    case AnimalType.dog:
      print('Dog');
      break;
    case AnimalType.bird:
      print('Bird');
      break;
    case AnimalType.fish:
      print('Fish');
      break;
  }

  //using enum with mixins
  print("====================================");
  final animal1 = AnimalTypes.cat;
  final animal2 = AnimalTypes.dog;
  final animal3 = AnimalTypes.Fish;


  try{
    animal1.jump();
    animal2.jump();
    animal3.jump();
  }catch(e){
    print(e);
  }

  //extending enums
  print("====================================");
  Vehicles.car
    ..go()
    ..stop();
  Vehicles.truck
    ..go()
    ..stop(); 
  Vehicles.bicycle
    ..go()
    ..stop();
  Vehicles.motorcycle
    ..go()
    ..stop();

  //implementing comparable with enums
  print("====================================");
  print([...TeslaCars.values]..sort());//sort is void function, create copy of the array(...), invoke sort then return the value (..) 


}

class Person{
  final String name;
  final Car car;

  const Person({required this.name, required this.car});
}

void describe(AnimalType? animalType){
  switch(animalType){
    case AnimalType.cat:
      print('Cat');
      break;
    case AnimalType.dog:
      print('Dog');
      break;
    case AnimalType.bird:
      print('Bird');
      break;
    case AnimalType.fish:
      print('Fish');
      break;
    default:
      print('Unknown animal');
  }
}

AnimalType? animalType({
  required String fromStr,
}){ 
  try{
    return AnimalType.values.firstWhere((element) => element.name == fromStr);
  }catch(e){
    print(e);
    return null;
  }
}

enum AnimalType {
  cat,
  dog,
  bird,
  fish,
}

enum VehicleType{
  truck,
  car,
  bicycle,
  motorcycle,
}

class Animal{
  final String name;
  final AnimalType type;

  const Animal({required this.name, required this.type});
}

//enhanced enumeration in dart is so complex and weird
enum Car{

  //case has to hard code the values for theses properties
  teslaModelX(
    manufacturer: 'Tesla',
    model: 'Model X',
    year: 2020,
  ),

  teslaModelY(
    manufacturer: 'Tesla',
    model: 'Model Y',
    year: 2020,
  );

  final String manufacturer;
  final String model;
  final int year;

  const Car({required this.manufacturer, 
  required this.model, 
  required this.year});

  @override
  String toString() {
    return 'Car{manufacturer: $manufacturer, model: $model, year: $year}';
  }
}

enum ProgrammingLanguages{
  dart,
  java,
  kotlin,
  swift,
}

mixin CanJump{
  int get feetCount;

  void jump(){
    if (feetCount < 1) {
      throw Exception('Cannot jump');
    }else{
      print('jumped!');
    }
  }
}

enum AnimalTypes with CanJump{
  //case has to hard code the values for theses properties
  cat(feetCount: 4),
  dog(feetCount: 4),
  Fish(feetCount: 0);

  @override
  final int feetCount;
  const AnimalTypes({required this.feetCount});
}

enum Vehicles{
  car,
  truck,
  bicycle,
  motorcycle;

  void go(){
    print('going.....');
  }
}

extension VehicleExtension on Vehicles{
  void stop(){
    print('stopping.....');
  }
}

enum TeslaCars implements Comparable<TeslaCars>{

  //case has to hard code the values for theses properties
  teslaModelX(weightInKg: 2.7),
  teslaModelY(weightInKg: 2.5),
  teslaModelS(weightInKg: 1.3),
  teslaModelZ(weightInKg: 3.5);

  final double weightInKg;

  const TeslaCars({required this.weightInKg});
  
  @override
  int compareTo(TeslaCars other) => weightInKg.compareTo(other.weightInKg); 

}

/*
  in swift, rust
  >> each enum have ability to store data, carry with its values
  ! dart doesn't have this feature
  enum ObjectType{
    case house(roomCount: Int, hasGarden: Bool)
    case car(brand: String, hasSunroof: Bool)
    case book(title: String, pageCount: Int)

    let car1 = ObjectType.car(brand: "Tesla", hasSunroof: true)
    let car2 = ObjectType.car(brand: "BMW", hasSunroof: false)
  } 
*/


