void main(List<String> args) {
  //optionality : have or not have a value in dart
  const String? name = 'dart';//? optional String may be conation or not conation a value
  print(name);
  const String? name2 = null;
  print(name2);

  //untyped null values dynamic
  dynamic name3 = null;
  print(name3);
  const double? someValue = null;
  print(someValue);

  //comparing optionals
  int? age = 10;
  //error int age = null;
  age = null;
  print(age);

  if (age == null) {
    print('age is null');
  } else {
    print('age is not null');
  }

  //nullable default values
  int a;
  a = 20;
  print(a);
  String? firstName;//default initialize to null
  print(firstName);

  //compund assignment operators
  firstName ??= 'dart';//if firstName is null then assign dart to it
  print('firstName is $firstName');

  String? lastName;
  lastName = 'flutter';
  //lastName ??= 'flutter';//meaningless
  print('lastName is $lastName');

  //null-aware operators to access properties and methods of nullable values
  String? name4;
  print(name4?.length);//if name4 is null then return null

  String? name5 = 'dart';
  print(name5?.length);//the name5 is not null then return the length of name5

  String? nullName;
  print(nullName ?? 'okay');
  final bla = nullName ?? 'okay';//data type of bla is String
  print(bla);

  String? nullName2;
  final bla2 = nullName2 ??= nullName2;//the data type of bla2 is nullable String
  print(bla2);//i cannot garantee that nullName2 or nullName is not null

  print(nullName ?? nullName2 ?? 'okay');//if nullName is null then check nullName2 if null then return okay

  //nullable collections
  List<String>? names;//entire list is nullable or not = null or ['dart', 'flutter']
  List<String?>? names2;//both the list and it's contents in the list is nullable or not = ['dart', null, 'flutter'], or empty list []
  names2?.add('dart');
  print(names2);
  names2?.add(null);
  print(names2);
  //bothe will be null 
  names2 = [];
  names2?.add('dart');
  print(names2);
  names2?.add(null);
  print(names2);

  names2.add('flutter');
  print(names2);
  names2.add(null);
  print(names2);

  //but 
  names2 = null;
  names2?.add('Java');
  print(names2);
  names2?.add(null);
  print(names2);

  List<String?>? names3;
  names3?.add('dart');
  names3?.add(null);
  print(names3);

  final first = names3?.first;//if names3 is null then first is null
  print(first ?? 'not first name found');

  print('here');
  List<String?>? names4 = [];
  names4.add('dart');
  names4.add(null);
  print(names4);

  //force unwarpping
  final String? fName;//implicity set to null
  //print(fName);//if fName is null then throw an exception, because the final key word so we either reomve the final or set to null
  final String? nName = null;
  //final foo = nName!;//result is not optional variable string not string?, you enforce dart to read it's contents
  print(nName ?? 'no name found');
}

void something(int? age){//dart dosn't know if age is null or not
  if (age == null) {
    print('age is null');
  } else {
    print('age is not null');
  }
}

void something2(String? one, String? two){
  one ??= two;//dart dosn't know if one is null or not, two also could be null
}