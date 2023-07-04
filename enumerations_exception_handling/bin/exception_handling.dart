
void main(List<String> args) async{
  //Throwing an exception inside a constructor of class
  tryCreatingPerson(age: 20);
  tryCreatingPerson(age: -20);
  tryCreatingPerson(age: 200);
  tryCreatingPerson();

  //Custom Exception Class
  print("=====================================");
  tryCreatingPersonCustomException(age: 20);
  tryCreatingPersonCustomException(age: -20);
  tryCreatingPersonCustomException(age: 200);
  tryCreatingPersonCustomException();

  //Rethrow
  print("=====================================");
  try{
    tryCreatingPersonCustomExceptionWithRethrow(age: 20);
    tryCreatingPersonCustomExceptionWithRethrow(age: -20);//this it the one that will be executed, because it is the first one that throws an exception
    //from rethrow it will be handled by the catch block in this try catch block
    tryCreatingPersonCustomExceptionWithRethrow(age: 200);//This will not be executed
    tryCreatingPersonCustomExceptionWithRethrow();//This will not be executed
  }catch(exception, stackTrace){
    print(exception);
    print(stackTrace);
  }

  //Finally block
  print("=====================================");
  final db = DataBase();
  try{
    await db.getData();
  }on DatabaseNotOpenException {
    print("we forgot to open the database");
  }

  try{
    await db.getData();
    await db.closeDB();//This will not be executed
  }on DatabaseNotOpenException {
    print("we forgot to open the database");
  }

    try{
    await db.getData();
  }on DatabaseNotOpenException {
    print("we forgot to open the database");
  }finally{
    await db.closeDB();
  }  

  try{
    await db.openDB();
    await db.getData();
    await db.closeDB();
  }on DatabaseNotOpenException {
    print("we forgot to open the database");
  }

  //Custom Throw Annotation
  print("=====================================");
  try{
    print("Dog aged 11 is going to run...");
    Dog(age: 11, isTired: false).run();
  }catch(e){
    print(e);
  }

  try{
    print("A tired dog is going to run...");
    Dog(age: 2, isTired: true).run();
  }catch(e){
    print(e);
  }

  //ArgumentError
  print("=====================================");
  final p1 = Person3(age: 10);
  print(p1); 
  p1.age = 0;
  print(p1);

  try{
    p1.age = -10;
    print(p1);
  } catch(e){
    print(e);
  } finally{
    print(p1);
  }

}

void tryCreatingPerson({int age = 0}){
  try{
    print(Person(age : age).age);
  }catch(e){
    print(e.runtimeType);
    print(e);
  }
}

tryCreatingPersonCustomException({int age = 0}){
  try{
    print(Person2(age : age).age);
  }on InvalidAgeException catch(exception, stackTrace){
    print(exception);
    print(stackTrace);
  }
}

tryCreatingPersonCustomExceptionWithRethrow({int age = 0}){
  try{
    print(Person2(age : age).age);
  }on InvalidAgeException {
    rethrow;//Rethrow the exception, so that it can be handled by the caller
  } catch(exception, stackTrace){
    print(exception);
    print(stackTrace);
  }
}

class Person{
  int age;

  Person({required this.age}){
    if(age <= 0){
      throw Exception("Age cannot be negative or zero");
    }else if(age > 150){
      throw Exception("Age cannot be greater than 150");
    }
  }
}

class InvalidAgeException implements Exception{
  final int age;
  final String message;
  
  InvalidAgeException(this.age, this.message);

  @override
  String toString() {
    return "InvalidAgeException: $age, $message";
  }
}

class Person2{
  int age;

  Person2({required this.age}){
    if(age <= 0){
      throw InvalidAgeException(age, 'Age cannot be negative or zero');
    }else if(age > 150){
      throw InvalidAgeException(age, 'Age cannot be greater than 150');
    }
  }
}

class DataBase{
  bool _isDBOpen = false;

  Future<void> openDB(){
    return Future.delayed(Duration(seconds: 1), (){
      _isDBOpen = true;
      print("DataBase opened");
    }); 
  }

  Future<String> getData(){
    if (!_isDBOpen){
      throw DatabaseNotOpenException();
    }
    return Future.delayed(Duration(seconds: 1), () => "Data from DB");
  }

  Future<void> closeDB(){
    return Future.delayed(Duration(seconds: 1), (){
      _isDBOpen = false;
      print("DataBase closed");
    }); 
  }
}

class DatabaseNotOpenException implements Exception{

  @override
  String toString() {
    return "DatabaseNotOpenException";
  }
}

class Throws<T>{
  final List<T> exceptions;

  const Throws(this.exceptions);
}

class DogIsTooOldException implements Exception{
  
  const DogIsTooOldException();
}

class DogIsTooTiredException implements Exception{
  
  const DogIsTooTiredException();
}

class Animal{
  final int age;

  const Animal({required this.age});

  //itself is not doing in thing, just a decorative annotation, it throws this error
  @Throws([UnimplementedError])//This is a custom annotation, annotation call a const constructor, 
  void run() =>  throw UnimplementedError();//any class want to extend this class is has to implement this method 
}

class Dog extends Animal{
  final bool isTired;

  const Dog({required super.age, required this.isTired});

  @Throws([DogIsTooOldException, DogIsTooTiredException])
  ///this function throws the following exceptions
  ///- [DogIsTooOldException] if the dog is older than 10 years
  ///- [DogIsTooTiredException] if the dog is tired
  @override
  void run() {//in this overridden version, it throws two exceptions
    if(age > 10){
      throw DogIsTooOldException();
    }else if(isTired){
      throw DogIsTooTiredException();
    }else{
      print("Dog is running");
    }
  }

}

class Person3{
  int _age;

  Person3({required int age}): _age = age;

  int get age => _age;

  set age(int value){
    if(value < 0){
      throw ArgumentError('Age cannot be negative');
    }
    _age = value;
  }

  @override
  String toString() {
    return "Person3:(age: $age)";
  }

}
