import 'package:collection/collection.dart';

void main(List<String> args) {
  //set is unordered collection of values seen to be equal to another value using particular mechanism, each value cannot be duplicated
  //unique list of values
  final pls = {'Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'};
  print(pls);
  pls.add('Java');
  print(pls);

  print("=========================================");
  //spread operator
  final pls2 = {'Go', 'Ruby', 'Kotlin', ...pls};
  print(pls2);

  final setListPlsNonDuplicates = {'Go', 'Ruby', 'Kotlin', 'Go', 'Kotlin', ...pls};
  print(setListPlsNonDuplicates);

  //set of list
  print("=========================================");
  final setListPls = ['Go', 'Ruby', 'Kotlin', 'Go', 'Kotlin'];
  //convert as entire list
  final nonDuplicatesPls = {setListPls, setListPls};
  print(nonDuplicatesPls);
  //convert as each element
  final nonDuplicatesPls2 = {...setListPls};

  print(nonDuplicatesPls2);

  //hashing concept
  print("=========================================");
  final address1 = '14 Main Street';
  final address2 = '14 Main Street';
  print(address1.hashCode);
  print(address2.hashCode);
  print(address1 == address2);

  //equality in sets
  print("=========================================");
  final set1 = {'Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'};
  final set2 = {'Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'};
  if (set1 == set2) {
    print('set1 and set2 are equal');
  } else {
    print('set1 and set2 are not equal');
  } 

  //set comparisons
  print("=========================================");
  if (SetEquality().equals(set1, set2)) {//if orders are different, it will be true, irrespective of order
    print('set1 and set2 are equal');
  } else {
    print('set1 and set2 are not equal');
  }

  //set operations
  print("=========================================");
  final set3 = {'Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'};
  final set4 = {'Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript', 'Go', 'Ruby', 'Kotlin'};
  final union = set3.union(set4);
  print(union);
  final intersection = set3.intersection(set4);
  print(intersection);
  final difference = set4.difference(set3);
  print(difference);
  
  //how sets actually work internally(hash code and equality)
  print("=========================================");
  final p1 = Person(name: 'John', address: '14 Main Street');
  final p2 = Person(name: 'John', address: '14 Main Street');
  print(p1.hashCode);
  print(p2.hashCode);
  
  final setBoth = {p1, p2}; 
  print(setBoth);

  print("=========================================");
  print(p1.hashCode);
  print(p2.hashCode);

  print("=========================================");
  print(p1 == p2);
  print({p1, p2});//it one object, because it is the same object

  print("=========================================");
  final d1 = Dog(name: 'John', address: '14 Main Street');
  print(d1.hashCode);
  print(p1.hashCode);
  print({p1, d1});//it is different object, because it is different class
  print({p1, p2, d1});
}

class Person{
  final String name;
  final String address;

  Person({required this.name, required this.address});

  @override
  String toString() {
    return 'Person{name: $name, address: $address}';
  }

  @override
  int get hashCode => Object.hash(name, address);

  @override
  bool operator == (Object other) => identical(this, other) ||
  other is Person && name == other.name  && address == other.address;
  
}

class Dog{
  final String name;
  final String address;

  Dog({required this.name, required this.address});

  @override
  String toString() {
    return 'Dog{name: $name, address: $address}';
  }

  @override
  int get hashCode => Object.hash(name, address);

  @override
  bool operator == (Object other) => identical(this, other) ||
  other is Dog && name == other.name  && address == other.address;
  
}