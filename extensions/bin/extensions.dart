import 'dart:math';

const json = {
  'name': 'Dart',
  'age': 25,
  'country': 'Egypt',
};

void main(List<String> args) {
  final value = 20;
  final timesFour = value.timesFor;
  print(timesFour);

  //extension on string
  print("===================================");
  final name = "Dart";
  print(name.reversed);

  //extension on iterable type
  print("===================================");
  final numbers = [1, 2, 3, 4, 5];
  print(numbers.sum);
  final numbers2 = [1.2, 2.3, 3.4, 4.5, 5.6];
  print(numbers2.sum);

  //extension for ranges
  print("===================================");
  print(1.to(10));
  print(1.to(10, inclusive: true));
  print(1.to(10, step: 2));
  print(10.to(1));
  print(10.to(1, inclusive: true));
  print(10.to(1, step: 2));

  //extension for check duplicates
  print("===================================");
  final numbers3 = [1, 2, 3, 4, 5];
  print(numbers3.hasDuplicates);
  final numbers4 = [1, 2, 3, 4, 5, 1];
  print(numbers4.hasDuplicates);

  //extension on map(map a value of a key inside map)
  print("===================================");
  final String? ageAsSTring = json.find('age', (int age) => age.toString());
  print(ageAsSTring);
  final String? helloName = json.find('name', (String name) => 'Hello $name')!;
  print(helloName);


  //extension on enum
  print("===================================");
  for (final animal in AnimalType.values) {
    print(animal.nameContainUpperCaseLetters);
  }

  //extension on Functions
  print("===================================");
  print(add.callWithRandomValues());
  print(subtract.callWithRandomValues());

  //extension names(extension override)
  print("===================================");
  const person = Person(name: 'Ahmed', age: 25, country: 'Egypt');
  //print(person.description); //! error dart does not know which description to use
  print(ShortDescription(person).description);
  print(LongDescription(person).description);

}

extension on int {
  int get timesFor => this * 4;
}

extension on String {
  String get reversed => split('').reversed.join();
}

extension SumOfIterable<T extends num> on Iterable<T> {//know that the data type is num 
  T get sum => reduce((value, element) => value + element as T);//but the return value not know is int or double so we use generic type
}

extension on int{
  Iterable<int> to(int end, {bool inclusive = false, int step = 1}) =>  end > this 
  ? [for (var i = this; i < end; i += step) i, if (inclusive) end] 
  : [for (var i = this; i > end; i -= step) i, if (inclusive) end];
}

extension on Iterable{
  bool get hasDuplicates => toSet().length != length;
}

extension Find<K, V, R> on Map<K, V>{
  R? find<T>(
    K key,
    R? Function(T value) cast,
  ){
    final value = this[key];
    if(value != null && value is T){
      return cast(value as T);
    }else{
      return null;
    }
  }
}

enum AnimalType{
  cat,
  dog,
  Bird,
  Fish,
}

extension on Enum {
  bool get nameContainUpperCaseLetters => name.contains(RegExp(r'[A-Z]'));
}

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;

typedef IntFunction = int Function(int, int);

extension on IntFunction {
  int callWithRandomValues () {
    final a = Random().nextInt(1000);
    final b = Random().nextInt(1000);
    print('a = $a, b = $b');
    return call(a, b);
  }
}

class Person {
  final String name;
  final int age;
  final String country;

  const Person({
    required this.name,
    required this.age,
    required this.country,
  });
}

//short description
extension ShortDescription on Person {
  String get description => '$name, $age, $country';
}

//long description
extension LongDescription on Person {
  String get description => 'This is Person his name is $name, his age is $age, and his country is $country';
}