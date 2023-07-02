import 'package:collection/collection.dart';

void main(List<String> args) {
  //set comprehensions
  final str = 'Alexandria';
  final chars = {for (final char in str.toLowerCase().split('')) char};
  print(chars);

  final chars2 = {for (final char in str.toLowerCase().split(''))
    'axi'.contains(char) ? null : char
  }..removeAll([null])..cast<String>;//it will produce an optional set of strings
  print(chars2);

  //list comprehensions
  final allNumbers = Iterable.generate(100);
  final evenNumber = [for (final n in allNumbers) if(n%2 == 0) n];
  print(evenNumber);
  //functional way will produce an iterable, with print not all evaluated to console(lazily evaluated)
  final oddNumberFunctional = allNumbers.where((number) => number%2 != 0).toList();
  print(oddNumberFunctional);

  //map comprehensions
  print("=========================================");
  final info = {
    'name': 'John',
    'surname': 'Doe',
    'age': 30,
    'height': 1.80,
    'isMarried': false,
    'hobbies': ['running', 'swimming', 'hiking']
  };
  final info2 = {
    for (final entry in info.entries)
      entry.key: entry.value
  };

  final pls = ['Dart', 'Java', 'Python', 'C#', 'C++', 'JavaScript'];
  final pls2 = {
    for (final pl in pls)
      pl: pl.length
  };
  print(info2);
  print(pls2);

  //most important function in collections
  //list of boolean values representation
  print("=========================================");
  testBoolList();

  //canonicalized map
  print("=========================================");
  testCanonicalizedMap();


  //combined iterable view
  print("=========================================");
  testCombinedIterableView();

  //combined list view
  print("=========================================");
  testCombinedListView();

  //combined map view
  print("=========================================");
  testCombinedMapView();

  //map merging
  print("=========================================");
  testMapMerging();
  
}

void testBoolList() {
  final boolList = BoolList(10, growable: true);
  print(boolList);
  boolList[3] = true;
  if(boolList[3]) {
    print('boolean value at index 3 is true');
  }else{
    print('boolean value at index 3 is false');
  }
  print(boolList);

}

void testCanonicalizedMap(){
  final plsTechnologiesDictionary = {
    'Dart': 'Flutter',
    'Java': 'Android',
    'Python': 'Data Science',
    'C#': 'Unity',
    'C++': 'Game Development',
    'JavaScript': 'Web Development'
  };

  final canonMap = CanonicalizedMap.from(plsTechnologiesDictionary, (key) => key.length); 
  print(canonMap);
  final canonMap2 = CanonicalizedMap.from(plsTechnologiesDictionary, (key) => key.split('').first);
  print(canonMap2);
}

void testCombinedIterableView(){
  final one = [1, 2, 3];
  final two = [4, 5, 6];
  final three = [7, 8, 9];
  var combined = CombinedIterableView([one, two, three]);
  print(combined);
  two.add(10);
  print(combined);
}

void testCombinedListView(){
  final List<String> arabicNames = ['Ahmed', 'Mohamed', 'Ali', 'Omar', 'Youssef'];
  final List<String> englishNames = ['Danial', 'John', 'Alex', 'Mark', 'David'];
  final List<String> frenchNames = ['Jean', 'Pierre', 'Paul', 'Jacques', 'Louis'];
  final names = CombinedListView([arabicNames, englishNames, frenchNames]);
  print(names);
  if (names.contains('Danial')) {
    print('Danial is in the list');
  }
  try{
    names.add('khadija');
  }catch(e){
    print(e);
  }

  arabicNames.removeAt(0);
  print(names);
}

void testCombinedMapView(){
  var mapCountries1 = {'Egypt': 'Cairo', 'France': 'Paris', 'England': 'London'};
  var mapCountries2 = {'Germany': 'Berlin', 'Italy': 'Rome', 'Spain': 'Madrid'};
  var mapCountries3 = {'USA': 'Washington', 'Canada': 'Ottawa', 'Mexico': 'Mexico City'};
  var mapCountries4 = {'Japan': 'Tokyo', 'China': 'Beijing', 'India': 'New Delhi', 'Egypt': 'Cairo'};
  var mapCountries = CombinedMapView([mapCountries1, mapCountries2, mapCountries3, mapCountries4]);
  print(mapCountries);

  if (mapCountries.containsKey('Egypt')) {
    print('Egypt is in the list');
  }
  
  mapCountries2['Germany'] = 'Munich';
  print(mapCountries);

  try{
    mapCountries['France'] = 'Lyon';
  }catch(e){
    print(e);
  }
}

void testMapMerging() {
  const info1 = {
    'name': 'John',
    'surname': 'Doe',
    'age': 30,
    'height': 1.80,
    'isMarried': false,
    'hobbies': ['running', 'swimming', 'hiking']
  };
  const info2 = {
    'name': 'Jane',
    'surname': 'Doe',
    'age': 25,
    'height': 1.70,
    'isMarried': true,
    'hobbies': ['reading', 'swimming', 'hiking']
  };

  final mergedInfo = mergeMaps(info1, info2);
  print(mergedInfo);

  final mergedInfo2 = mergeMaps(info1, info2, value:(p0, p1) => '$p0, $p1');
  print(mergedInfo2);
}
