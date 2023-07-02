void main(List<String> args){

  // List implemented underlyning using linked list, similar to array but can grow and shrink in size
  /*
    .List is ordered collection
    .List is indexed collection
    .List is mutable collection
    .List can have duplicate elements
    .List can have elements of different types
    .List can be growable or fixed length
  */

  const pls = ['Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'];

  for (final pl in pls){
    print(pl);
  }

  print("=========================================");
  //reverse list
  for (final pl in pls.reversed){
    print(pl);
  }
  print(pls.reversed);

  print("=========================================");
  //search list
  print(pls.contains('Dart'));

  if (pls.contains('Go')){
    print('Go is in the list');
  } else {   
    print('Go is not in the list');
  }

  const serachKey = 'Dart';
  for (final pl in pls){
    if (pl == serachKey){
      print('$serachKey is in the list');
    }
  }

  print("=========================================");
  //where function
  final filteredList = pls.where((pl) => pl.contains('C'));//like a closure, arrow function
  print(filteredList);

  print("=========================================");
  final filteredList2 = pls.where((stringStartWithJ));
  print(filteredList2);

  print("=========================================");
  //make it as closure
  final filteredList3 = pls.where((String s) => s.startsWith('D'));
  print(filteredList3);
  

  //list subscript operator
  print("=========================================");
  print(pls);
  print(pls.elementAt(0));
  print(pls[1]);
  print(pls.first);
  print(pls.last);

  //sub ranges of list
  print("=========================================");
  pls.sublist(0,3).forEach(print);

  //add element to list
  print("=========================================");
  final frameworks = ['Flutter', 'React Native', 'Ionic'];
  frameworks.add('Xamarin');
  print(frameworks);

  //insert element to list
  print("=========================================");
  frameworks.insert(0, 'NativeScript');
  print(frameworks);

  //remove element from list
  print("=========================================");
  frameworks.remove('Xamarin');
  print(frameworks);

  //remove element at index
  print("=========================================");
  frameworks.removeAt(0);
  print(frameworks);

  //compare two list
  print("=========================================");
  final dbs = ['MongoDB', 'MySQL', 'PostgreSQL'];
  final dbs2  = ['MongoDB', 'MySQL', 'PostgreSQL'];
  print(dbs == dbs2);
  //in const initialization, the list is immutable so it will be true when compare
  const dbs1 = ['MongoDB', 'MySQL', 'PostgreSQL'];
  const dbs3  = ['MongoDB', 'MySQL', 'PostgreSQL'];
  print(dbs1 == dbs3);

  //sort list
  print("=========================================");
  final numbers = [1, 5, 3, 4, 2];
  numbers.sort();
  print(numbers);

  //sort list with custom function
  print("=========================================");
  final numbers2 = [1, 5, 3, 4, 2];
  numbers2.sort((a, b) => b.compareTo(a));
  print(numbers2);

  //map list
  print("=========================================");
  final numbers3 = [1, 5, 3, 4, 2];
  final numbers4 = numbers3.map((e) => e * 2);
  print(numbers4);

  //map list with custom function
  print("=========================================");
  ['Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'].map((e) => e.length).forEach(print);

  //fold list reduce an iterable to a single value
  print("=========================================");
  final numbers5 = [1, 5, 3, 4, 2];
  final sum = numbers5.fold(0, (previousValue, element) => previousValue + element);
  print(sum);
  final multiplier = numbers5.fold(1, (previousValue, element) => previousValue * element);
  print(multiplier);

  print("=========================================");
  final totalLength = ['Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'].fold(0, (previousValue, element) => previousValue + element.length);
  print(totalLength);

  print("=========================================");
  final result = ['Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'].fold('', (result, thisStr) => "$result ${thisStr.toUpperCase()}");
  print(result);

  //expand list
  print("=========================================");
  final numbers6 = [1, 5, 3, 4, 2];
  final numbers7 = [6, 7, 8, 9, 10];
  final numbers8 = [11, 12, 13, 14, 15];
  final numbers9 = [16, 17, 18, 19, 20];
  final numbers10 = [numbers6, numbers7, numbers8, numbers9];
  //list of lists
  print(numbers10);
  
  print([1, 2, 3,...numbers7]);
  print([numbers6,...numbers7,...numbers8,...numbers9]);
}

bool stringStartWithJ(String s){
  return s.startsWith('J');
}