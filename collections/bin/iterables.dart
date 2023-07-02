// iterable: list, set, map
//are lazily evaluated, generated lists that can be iterated through only once
//iterable is a collection of elements that can be accessed sequentially
//iterable is actually smart, trying not to waste any resources


import 'dart:collection';

void main(List<String> args) {
  final iterable2 = Iterable.generate(20, (i) => getName(i));
  print(iterable2);

  //what difference between iterable and list?? list are not lazy generated all up front
  for (final name in iterable2.take(2)){
    print(name);//function called as same time of value in take()
  }//the getName function called 2 times, and not called again, until you are using this iterable2

  //map lists to iterable
  print("=========================================");
  const names = ['John', 'Jane', 'Jack', 'Jill'];
  final iterableNamesUpperCase = names.map((name) {
    print('map function called for $name');
    return name.toUpperCase();
    });//map realize that you may do a heavy calculation on this list, so that
    //it will not do it all up front, it will do it when you need it, so it return iterable
  print(iterableNamesUpperCase);
  
  for (final name in iterableNamesUpperCase.take(2)){
    print(name);
  }

  //unmodifiable list view
  print("=========================================");
  final unmodifiableList = List.unmodifiable(names);
  print(unmodifiableList);
  try {
  unmodifiableList.add('Jenny');//error, because it is unmodifiable
  } catch (e) {
    print(e);
  } 

  //unmodifiable view is for encapsulation purpose

  //unmodifiable map view
  print("=========================================");
  final info = {
    'name': 'John',
    'surname': 'Doe',
    'age': 30,
    'height': 1.80,
    'isMarried': false,
    'hobbies': ['running', 'swimming', 'hiking']
  };
  final unmodifiableMap = UnmodifiableMapView(info);
  print(unmodifiableMap);
  try {
  unmodifiableMap['weight'] = 80;//error, because it is unmodifiable
  } catch (e) {
    print(e);
  }

  //encapsulation purpose with unmodifiable view
  print("=========================================");
  final person = Person(name: 'John', siblings: [Person(name: 'Jane'), Person(name: 'Jack')]);
  person._siblings?.add(Person(name: 'Jill'));
  (person._siblings)?.forEach((element) {print(element.name);});

  //synchronous generator
  print("=========================================");
  for (final name in getNames()){
    print(name);
  }

}

String getName(int i) {
  print('Get name got called');
  return 'name $i';
}

class Person{
  final String name;
  final List<Person>? _siblings;

  UnmodifiableListView<Person>? get siblings => _siblings == null ? null : UnmodifiableListView(_siblings!);

  const Person({required this.name, List<Person>? siblings}): _siblings = siblings;

}

Iterable<String> getNames() sync*{
  print('getNames() started producing Bob');
  yield 'Bob';
  print('getNames() started producing Alice');
  yield 'Alice';
  print('getNames() started producing Jack');
  yield 'Jack';
  print('getNames() started producing template Names Function');
  yield* templateNames();
}

Iterable<String> templateNames() sync*{
  print('getNames() started producing Bob');
  yield 'foo';
  print('getNames() started producing Alice');
  yield 'bar';
  print('getNames() started producing Jack');
  yield 'baz';
}