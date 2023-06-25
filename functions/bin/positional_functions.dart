/*
  Positional Functions
  1. Required Parameters
  2.pass in order
  3.don't have default values
  4.don't have names associated with them
  5. can be optional
*/
void main(List<String> args) {
  //sayGoodbyeTo('ali')//error can't pass one argument
  //sayGoodbyeTo();//error can't pass no argument
  sayGoodbyeTo('ali', 'ahmed');

  //sayGoodbyeTo2();//error can't pass no argument
  //sayGoodbyeTo2('ali');//error can't pass one argument
  sayGoodbyeTo2('ali', 'ahmed');
  sayGoodbyeTo2(null, null);
  sayGoodbyeTo2('ali', null);
  sayGoodbyeTo2(null, 'ahmed');

  makeUpperCase();//valid code, because name is optional not have default value, should be optional, with assign null to it 
  makeUpperCase('ali');//pass in order
  makeUpperCase(null);
  makeUpperCase('ali', 'ahmed');
  //makeUpperCase('ali', null);//invalid code because lastName is non-optional and have default value
  makeUpperCase(null, 'ahmed');

  //describeFully();//invalid code because fName is required
  describeFully('ali');
  describeFully('ali', lName: null);
  describeFully('ali', lName: 'ahmed');


  print(add());
  print(add(5));
  print(add(5, 6));

  print(minus());
  print(minus(5));
  print(minus(10, 6));

  print(performOperation(5, 6, (a, b) => a + b));
  print(performOperation(5, 6, (a, b) => a - b));
  print(performOperation(5, 6, add2));
  print(performOperation(5, 6, minus));

  final v = doSomething(10, 20);//return a function
  print(v);
  print(doSomething(20, 10)());//call the returned function
  print(v());//call the returned function
  
}

void sayGoodbyeTo(String person, String anotherPerson) {//there is no {}
  print("Goodbye, $person and $anotherPerson");
}

void sayGoodbyeTo2(String? person, String? anotherPerson) {//there is no {}
  print("Goodbye, $person and $anotherPerson");
}

/*optional positional parameters , can be optional and be omitted, or can be non-optional and required default values
  1. surrounded by []
  2. can be named
  3. can have default values
  4. can be required
  5. can be optional
*/ 
void makeUpperCase([String? name, String lastName = 'Adel']) {//name is and optional optional positional parameter
  print(name?.toUpperCase()); 
  print(lastName.toUpperCase());
}


//mixing positional and named parameters
void describeFully(String fName, {String? lName = 'adel'}){
  print('Hello $fName $lName');
}


//the return value
int add ([int a = 1, int b = 2]) {return a + b;}//normal function

//Functions as first-class objects/citizens, become arrow funciton omit their return type
int add2([int a = 1, int b = 2]) => a + b;//arrow function
int minus([int lhs = 2, int rhs = 1]) => lhs - rhs;//arrow function
//function in dart can be passed as arguments to other functions
int performOperation(int a, int b, int Function(int, int) operation) => operation(a, b); 

//returning a function from another function, usually called factory functions
//usually don't do, but in functional programming it's common
int Function() doSomething(int lhs, int rhs) => () => lhs + rhs;//the return value is another function

