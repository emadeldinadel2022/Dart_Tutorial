//safe list is a list that is safe to use in a multi-threaded environment


import 'dart:collection';

void main(List<String> args) {
  try{
    final List<String> names = [];
    // !error, because it is empty
    print(names[1]);
    print(names.first);
    print(names.last);
  } catch (e) {
    print(e);
  }

  print("=========================================");
  try{
    final values = [1, 2, 3, 4, 5];
    values.length = 6;
    print(values);
  } catch (e) {
    print(e);
  }

  //to fix that:
  print("=========================================");
  final List<int?> values = [1, 2, 3, 4, 5];
  values.length = 6;
  print(values);

  //safe list class
  print("=========================================");
  const notFound = 'NOT_FOUND';
  const defaultValue = 'DEFAULT_VALUE';

  final mySafeList = SafeList<String>(absentValue: notFound, defaultValue: defaultValue, values: ['John', 'Jane', 'Jack']);
  print(mySafeList[0]);
  print(mySafeList[1]);
  print(mySafeList[2]);
  print(mySafeList[3]);

  mySafeList.length = 5;
  print(mySafeList);

  mySafeList.length = 0;
  print(mySafeList);
  print(mySafeList.first);
  print(mySafeList.last);

  //spread operator
  print("=========================================");
  final names1 = ['John', 'Jane', 'Jack'];
  final names2 = ['Jill', 'Jerry', 'Jenny'];
  final allNamesWrong = names1;
  allNamesWrong.addAll(names2);
  print(names1);//there issue here name1 have same content of allNamesWrong also
  print(names2);
  print(allNamesWrong);

  //using spread operator
  print("=========================================");
  final names3 = ['Ali', 'Ahmed', 'Hassan'];
  final names4 = ['Salah', 'Mohamed', 'Khaled'];
  final allNames = [...names3, ...names4];
  print(names3);
  print(names4);
  print(allNames);

  //using addAll
  print("=========================================");
  final anotherAllNames = [];
  anotherAllNames.addAll(names3);
  anotherAllNames.addAll(names4);
  print(names3);
  print(names4);
  print(anotherAllNames);

  //using spread operator addAll
  print("=========================================");
  final anotherAllNames2 = [...names3..addAll(names4)];
  print(names3);
  print(names4);
  print(anotherAllNames2);

  //spread operator with dictionary
  print("=========================================");
  final info = {
    'name': 'John',
    'surname': 'Doe',
    'age': 30,
    'height': 1.80,
    'isMarried': false,
    'hobbies': ['running', 'swimming', 'hiking']
  };

  final result = info;
  result.addAll({'weight': 80});
  print(info);
  print(result);

  print("=========================================");
  final info2 = {
    'name': 'John',
    'surname': 'Doe',
    'age': 30,
    'height': 1.80,
    'isMarried': false,
    'hobbies': ['running', 'swimming', 'hiking']};
  final result2 = {...info2, 'weight': 80};
  print(info2);
  print(result2);

  print("=========================================");
  final info3 = {
    'name': 'John',
    'surname': 'Doe',
    'age': 30,
    'height': 1.80,
    'isMarried': false,
    'hobbies': ['running', 'swimming', 'hiking']};
  final result3 = {...info3}..addAll({'Status': 'Good'});
  print(info3);
  print(result3);

}

//create own safe list class
class SafeList<T> extends ListBase<T>{
  final List<T> _list;
  final T absentValue;
  final T defaultValue;

  SafeList({required this.absentValue, required this.defaultValue, List<T>? values}) : _list = values ?? [];

  @override
  T operator [](int index) => index < _list.length ? _list[index] :  absentValue;

  @override
  void operator []=(int index, T value) => _list[index] = value;

  @override
  int get length => _list.length;

  @override
  set length(int newLength) {
    if (newLength <= _list.length){
      _list.length = newLength;
    } else {
      _list.addAll(List.filled(newLength - _list.length, defaultValue));
    }
  }

  @override
  T get first => _list.isNotEmpty ? _list.first : absentValue;

  @override
  T get last => _list.isNotEmpty ? _list.last : absentValue;

}
