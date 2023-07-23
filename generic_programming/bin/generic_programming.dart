
void main(List<String> args) {
  final doubleValue = eitherIntOrDouble(WhatToReturn.double);
  print(doubleValue);
  final double doubleValue2 = eitherIntOrDouble(WhatToReturn.double) as double;
  print(doubleValue2);
  final int intValue = eitherIntOrDouble(WhatToReturn.int) as int;
  print(intValue);

  print("=====================================");
  final doubleValue3 = eitherIntOrDouble2<double>();
  print(doubleValue3);
  final intValue2 = eitherIntOrDouble2<int>();
  print(intValue2);
  try{
    final stringValue = eitherIntOrDouble2();
    print(stringValue);
  }catch(e){
    print(e);
  }
  final int intValue3 = eitherIntOrDouble2();
  print(intValue3);
  final double doubleValue4 = eitherIntOrDouble2();
  print(doubleValue4);

  //Type Matching
  print("=====================================");
  try{
    print(typeMatching(1, 1));
    print(typeMatching(1, 1.0));
    print(typeMatching(1, "1"));
    print(typeMatching('a', 'f'));
  }catch(e){
    print(e);
  }

  print("=====================================");
  print(doTypeMatch(1, 1));
  print(doTypeMatch(1, 1.0));
  print(doTypeMatch(1, "1"));
  print(doTypeMatch('a', 'f'));

  //constraint on generic type
  print("=====================================");
  const momAndDad = {
    'mom': Person(),
    'dad': Person(),
  };

  const brotherAndSisterAndMyFish = {
    'brother': Person(),
    'sister': Person(),
    'fishy': Fish(),
  };

  final family = [momAndDad, brotherAndSisterAndMyFish];//both list and map are generic types
  describe(family);

  //unconstraint on generic type
  print("=====================================");
  const one = KeyValue(1, "one"); //MapEntry<int, String>
  print(one);
  const two = KeyValue(2, "two");//MapEntry<int, String>
  print(two);
  const three = KeyValue(3, 3.0);//MapEntry<int, double>
  print(three);
  const KeyValue four = KeyValue("four", 4);//MapEntry<dynamic, dynamic> to make dart understand KeyValue<String, int> or remove KeyValue
  print(four);

  //specialized generic type
  print("=====================================");
  const JSON<String> json ={
    'name': 'John',
    'age': '30',
  };//Map<String, String>
  print(json);

  //generic mixins
  print("=====================================");
  const person = Person2(height : 1.8);
  print(person.height);
  const tree = Tree(height : 2);
  print(tree.height);

  //generic class with generic extension
  print("=====================================");
  const tuple = Tuple(1, "one");
  print(tuple);
  final swapped = tuple.swap();//return is Tuple<dynamic, dynamic>, we lost our data types
  print(swapped);
  final swapped2 = tuple.swapping;//return is Tuple<String, int>, we don't lost our data types
  print(swapped2);
  final sum = Tuple(1, 2).sum;
  print(sum);
  final sum2 = Tuple(1.0, 2.0).sum;
  print(sum2);
  final sum3 = Tuple(1, 2.0).sum;
  print(sum3);
  final sum4 = Tuple(1.0, 2).sum;
  print(sum4);

  //generic Function
  print("=====================================");
  sort(ascending: true);
  sort(ascending: false);

  //handling lack of common ancestors
  print("=====================================");
  print(1.toInt() == 1);
  print(2.2.toInt() == 2);
  print(2.0.toInt() == 2);
  print(2.5.toInt() == 3);
  print("3".toInt() == 3);
  print("3.0".toInt() == 3);
  print(["4", "5"].toInt() == 4);
  print([4, 5].toInt() == 9);
  print(['2.4', '3.5'].toInt() == 6);
  print(['2', '3.5'].toInt() == 6);
  print({'2', 3, '4.2'}.toInt() == 9);
  print({'2', 3, '4.2', 5.0}.toInt() == 14);

  //generic extension on any data type
  print("=====================================");
  final personName = personThing.mapIfOfType(
    (Person3 p) => p.name
    ) ?? 
    'Unknown Person name';
  print(personName);
  final animalName = animalThing.mapIfOfType(
    (Person3 a) => a.name
    ) ?? 
    'Unknown Animal name';
  print(animalName);

  //generic function pointers
  print("=====================================");
  const integers = [100, 5, 2];
  const doubles = [33.0, 3, 2.0];
  print(integers.reduce(divide));
  print(doubles.reduce(divide));

  //class with generic properties
  print("=====================================");
  print(Person4(height: 1.8).heightRounded);
  print(Person4(height: 1).heightRounded);

}

enum WhatToReturn {
  int,
  double
}

num eitherIntOrDouble(WhatToReturn whatToReturn) {
  switch (whatToReturn) {
    case WhatToReturn.int:
      return 1;
    case WhatToReturn.double:
      return 1.0;
  }
}

T eitherIntOrDouble2<T extends num>(){//we return something that extends num
  switch (T) {
    case int:
      return 1 as T;
    case double:
      return 1.0 as T;
    default:
      throw Exception("Unknown type");
  }
}

bool typeMatching(Object a, Object b){
  return a.runtimeType == b.runtimeType;
}

bool doTypeMatch<T, E>(T a, E b){
  return T == E;
}

mixin CanBreathe {
  void breathe();
}

class Person with CanBreathe {
  const Person();
  @override
  void breathe() {
    print("Person is breathing");
  }
}

class Fish with CanBreathe {
  const Fish();
  @override
  void breathe() {
    print("Fish is breathing");
  }
}

typedef BreathingThings<T extends CanBreathe> = Map<String, T>;//typedef is a generic type
//or typedef BreathingThings<T extends CanBreathe> = Map<String, T extends CanBreathe>;//typedef is a generic type
//or typedef BreathingThings = Map<String, CanBreathe>;//typedef is a generic type

void describe(Iterable<BreathingThings> values){
  for(final map in values){
    for(final entry in map.entries){
      print("${entry.key} is a ${entry.value.runtimeType}");
      entry.value.breathe();
    }
  }
}

typedef KeyValue<K, V> = MapEntry<K, V>;

typedef JSON<T> = Map<String, T>;

mixin HasHeight<H extends num>{
  H get height;
}

typedef HasIntHeight = HasHeight<int>;
typedef HasDoubleHeight = HasHeight<double>;

class Person2 with HasDoubleHeight{
  @override
  final double height;
  const Person2({required this.height});
}

class Tree with HasIntHeight{
  @override
  final int height;
  const Tree({required this.height});
}

class Tuple<L, R> {
  final L left;
  final R right;
  const Tuple(this.left, this.right);

  @override
  String toString() => "Tuple(left: $left, right: $right)";
}

extension on Tuple{
  Tuple swap() => Tuple(right, left);
}

extension TupleExtension<L, R> on Tuple<L, R> {
  Tuple<R, L> get swapping => Tuple(right, left);
}

extension <L extends num, R extends num> on Tuple<L, R> {
  num get sum => left + right;
}

const ages = [1, 2, 3, 4, 5];
const names = ["one", "two", "three", "four", "five"];
const distances = [2.5, 2.3, 3.5, 4.1, 5.0];

int isLessThan<T extends Comparable>(T a, T b) => a.compareTo(b);
int isGreaterThan<T extends Comparable>(T a, T b) => b.compareTo(a);

void sort({required bool ascending}){
  final comparator  = ascending ? isLessThan : isGreaterThan;
  print([...ages]..sort(comparator));
  print([...names]..sort(comparator));
  print([...distances]..sort(comparator));
}

extension ToInt on Object {
  int toInt() {
    final list = [
      if (this is Iterable<Object>)
        ...this as Iterable<Object>
      else if (this is int)
        [this as int]
      else
        (double.tryParse(toString()) ?? 0.0).round()
    ];
    final returnValue = 
    list.map((e) => (double.tryParse(e.toString()) ?? 0.0).round());
    return returnValue.reduce((lhs, rhs) => lhs + rhs);
  }
}

abstract class Thing {
  final String name;
  const Thing({required this.name});
}

class Person3 extends Thing {
  final int age;

  const Person3({required String name, required this.age}) : super(name: name);
}

class Animal extends Thing {
  final int age;

  const Animal({required String name, required this.age}) : super(name: name);
}

const Thing personThing = Person3(name: "John", age: 30);
const Thing animalThing = Animal(name: "Dog", age: 5);

extension <T> on T {
  R? mapIfOfType<E, R>(R Function(E) f) {
    final shadow = this;
    if(shadow is E){
      return f(shadow);
    }else{
      return null;
    }
  }
}

T divide<T extends num>(T lhs, T rhs) {
  if (lhs is int && rhs is int) {
    return lhs ~/ rhs as T;
  } else {
    return lhs / rhs as T;
  }
}

class Person4<T extends num>{
  final T height;
  const Person4({required this.height});

  int get heightRounded => height.round();
}