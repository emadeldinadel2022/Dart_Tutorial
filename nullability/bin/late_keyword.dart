late String name;//contract that you gonna initialize it later, when you use it
/* why???
    .resolve the value that's benn placed only when used (resolved lazily)
    .chain of lazy resolve, function is not called constantly, function called only the first time when resolved
    .allow multiple assignments, keep reading or writing from it
    .you arenot allowed to re-establish the value or reassign new value to late variable have been already resolved with final kewyword
    .can have normal late variable that depends on another late final variable
    .don't write code tries to understand whether a late variable has as vlue or not if you're after than need to use optionals
    .assign late variable to a non late variable, resolve it immediately
    .final varialbes resolve late variables if it assign to the late variable result value
    .late instance variables should be initialized in the constructor, otherwise they won't be lazy
    .if you assigned late varibales in constructor, to be resolved immediately, unfortunately that's is bad thing
*/
void main(List<String> args) {
  try {
    print(name);
  } catch (e) {
    print(e);
  }
  name = 'Ahmed';
  print(name);
  name = 'Ali';
  print(name);

  //late initialization to function return or result
  print('before calling provideName()');
  late String name2 = provideName();//not using this name2 variable
  print('after calling provideName()');
  //just after and before will execute, because of late variable
  print('before calling provideName()');
  String name3 = provideName();
  print('after calling provideName()');
  print('before calling provideName()');
  print(name2);//now using name2 variable
  print('after calling provideName()');

  //late initialization to class
  final person = Person();//only constructor will be called, function with late not called
  print(person.age);
  print(person.description);//now function will be called

  //late initialization to dependency
  final person2 = Person2();
  print(person2.fullName);//now function will be called
  print(person2.firstName);
  print(person2.lastName);

  //multiple assignment of late variables
  final person3 = Person3();
  person3.description = 'description 1';//you cannot read late vars before assigning them
  print(person3.description);
  person3.description = 'description 2';
  print(person3.description);

  final woof = Dog();
  woof.description = 'woof woof';
  print(woof.description);

  try{
    woof.description = 'woof woof woof';
  }catch(e){
    print(e);
  }

  //pitfalls of late
  final person4 = Person4();

  try{
    //avoid doing this in real code since it's not aganist the recommendations, instead use nullable values
    print(person4.fullName);
  }catch(e){
    print(e);
  }

  person4.fName = 'Ahmed';
  person4.lName = 'Ali';
  print(person4.fullName);

  //initialize late variable with final
  late final bool isTeenger;
  const age = 12;
  if (age >= 13 && age <= 20) {
    isTeenger = true;
  } else if (age < 13){
    isTeenger = false;
  }

  try{//aviod those try catch in late variables
    isTeenger = false;//variable has been already resolved, assign
    print(isTeenger);
  }catch(e){
    print(e);
  }

  //assign late variable to a non late variable
  print('late fullName is being initialitzed');
  late final fullName = _getFullName2();
  print('after');
  print(fullName);

  print('late fullName is being initialitzed');
  late final fullName2 = _getFullName2();
  final resolvedFullName2 = fullName2;//normal final variable, using the late variable, so gone to resolved it
  print(resolvedFullName2);

  //late with nullable
  late String? name4;//late with nullable, you can assign null to it
  name4 = null;
  print(name4);

  //avoiding constructor initialization with late variables
  final ahmed = Person5(name: 'Ahmed');
  final ali = Person5(name: 'Ali');
  final family1 = wrongImplementationOfFamily(members: [ahmed, ali]);
  //getMembersCount() is called twice, because it's called in the constructor
  print(family1);
  print(family1.membersCount);

  final family2 = correctImplementationOfFamily(members: [ahmed, ali]);
  print(family2);
  print(family2.membersCount);//getMembersCount() is called once, because it's called when used

}

class Person5{
  final String name;
  
  Person5({required this.name});
}

class wrongImplementationOfFamily{
  final Iterable<Person5> members;
  late int membersCount;

  wrongImplementationOfFamily({required this.members}){//pass an iterable of members
    membersCount = getMembersCount();//memberCount is late variable, it shouldnot even be resolved,
    // it shoudnot call this function unill members count is used
  }

  int getMembersCount(){
    print('getMembersCount() is called');
    return members.length;
  }
}

class correctImplementationOfFamily{
  final Iterable<Person5> members;
  late int membersCount = getMembersCount();//memberCount is late variable, it shouldnot even be resolved,

  correctImplementationOfFamily({required this.members});//pass an iterable of members
  int getMembersCount(){
    print('getMembersCount() is called');
    return members.length;
  }
}

String _getFullName2(){
  print('_getFullName2() is called');
  return 'Ahmed Ali';
}

class Person4{
  late final String fName;
  late final String lName;
  //fullName is dependent on fName and lName, must resolve them first
  late String fullName = '$fName $lName';//late variable whose valuse not resolved until used
  //if fName and lName are not late, fullName must there is a constructor to initialize them
  //Person4(this.fName, this.lName);
}

class Cat{
  //late const String description;error can't declare late with const
}

class Dog{
  late final String description;//it can only be assigned once
}

class Person3{
  late String description;
}

class Person{
  late String description = heavyCalculationOfDescription();
  final int age;

  Person({this.age = 20}){//constructor canot be const
    print('Person() constructor is called');
  }

  String heavyCalculationOfDescription(){
    print('function heavyCalculationOfDescription is called');
    return 'description';
  }
}

class Person2{
  late String fullName = _getFullName();
  late String firstName = fullName.split(' ').first;
  late String lastName = fullName.split(' ').last;

  String _getFullName(){
    print('_getFullName() is called');
    return 'Ahmed Ali';
  }
}

String provideName() {
  print('provideName() is called');
  return 'Ahmed';
}