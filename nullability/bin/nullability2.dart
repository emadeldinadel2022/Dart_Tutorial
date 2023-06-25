void main(List<String> args) {
  final String? fName = null;
  //final len = fName.length;error
  if (fName == null) {//fName?.length not neccessary to add ?., becuase in if statement it is already checked for null
    print('fName is null');
  }else{
  final int len = fName.length;
  print(len);
  }

  //combing null-aware operators
  String? lName ;

  void changeLastName(){
    lName = 'Doe';
  }

  changeLastName();
  //final foo = lName;//foo is optional String
  if(lName?.contains('Doe') ?? false){
    print('lName contains Doe');
  }

  if(lName?.contains('Doe') == true){//smame as above
    print('lName contains Doe');
  }

  //extend optional type
  String getFullName(){//it is garanteed to return a value, or actual string
    return 'John Doe';//you canot return null
  }

  String? getFullNameOptional(){//isnot garanteed to return a value, or actual string
    return 'dart';//you can return null
  }

  final String fullName = getFullNameOptional() ?? getFullName();//result is garanteed to be a string
  print(fullName);

  final someName = getFullNameOptional();
  someName.describe();

  //unwarrping multiple optional types
  print(getFullName2(null, null));
  print(getFullName2('John', null));
  print(getFullName2(null, 'Doe'));
  print(getFullName2('John', 'Doe'));

  //optional FlatMap
  /*function allows you to drill down within an optionals and grab it's value, 
  map it to another datatype or different value into same datatype should that value not be null, if null it return null*/  
  String? fName2 = 'John';
  String? lName2 = 'Doe';
  final flName = fName2.flatMap((f) => lName2.flatMap((l) => '$f $l')) ?? 'either first or last name or both are null';//result is an optional string
  print(flName);


  //Default values for optional types
  int? age;
  //age.orDefault();// it will give you the value of age if it is not null, or it will give you the default value of 0

  String? name;
  //name.orDefault();// it will give you the value of name if it is not null, or it will give you the default value of '' empty String
  print(getFullName3(null,null));
  print(getFullName3('ali','ahmed'));
  print(getFullName3('ali',null));
  print(getFullName3(null,'ahmed'));



}

String getFullName2(
  String? fName, 
  String? lName
  ) => 
      withAll(
        [fName, lName], ///list of optional Strings
        (names) => names.join(' '),
      ) ?? 'Empty names';///if none of those values are null, then join them, or the result of withAll function is null return value of empty from getFullName function


/*we can aviod for check multiple conditions for null so 
we use this technique of function that takes of optional values 
then calls callback function if those values are not null, or nonr of those values is not null*/ 

T? withAll<T>(List<T?> optionals,///take a list of optional values of that type
  T Function(List<T>) callback,///take a callback function that takes a list of non-optional values of that type
 )=> optionals.any((element) => element == null) ///check if any of the values of list is null
 ? null ///if any of the values of list is null return null
 : callback(optionals.cast<T>());///if all values of list are not null, then cast them to non-optional values and pass them to callback function
  

extension Describe on Object?{//our extension is optional object that in invoking it we don't need to use the null-aware operator
  void describe(){
    if(this == null){
      print('this object is null');
    }else{
    print('$runtimeType: $this');
    }  
  } 
}

extension FlatMap<T> on T?{//flatmap is generic extension on optional type
  R? flatMap<R> (//return any value optionally with flatmap function as long it work with that data type R
    R? Function(T value) callback,//internally function to resolve the value of optional type give you T value, and return R value
  ){
    final shadow = this;
    if (shadow == null){//replace this with shadow
      return null;
  }else {
    return callback(shadow);//if we pass this dart cannot understand that this is not a optional value
  }//so we create shadow variable that is optional value, and pass it to callback function
  }
}

extension DefaultValues<T> on T? {//work with any type of optional value
  T get orDefault {//always return a non optional of the same data types
    final shadow = this;
    if(shadow != null){
      return shadow;
    }else {
      switch (T){
        case int:
          return 0 as T;
        case double:
          return 0.0 as T;
        case String:
          return 'es' as T;
        case bool:
          return false as T;
        default:
          throw StateError('No default value for type $T');
      }
    }
  }
}

String getFullName3(String? fName, String? lName) => '${fName.orDefault} ${lName.orDefault}';//result is garanteed to be a string
