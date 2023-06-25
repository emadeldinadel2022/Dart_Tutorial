//funciton is block of code to do a specific task, or to perform a related action, with body and optional return value
//function is object in dart, and type of function is Function
//function can be assigned to a variable or passed as parameter to another function
//function can be nested, and can access variables from outer scope
//function can be anonymous, and can be assigned to a variable
//function have signature where it is defined by name, parameter, and return type
//function can have optional parameter, and can be named parameter
//function can have default parameter value
//function can be defined in class, and can be instance method


//main funciton is entry point of dart program
void main(List<String> args) {//main is function  with return type void, and parameter List<String>, and args is variable name
  printWow();
  printHello();
  print(doNothing());


  helloName(name: null);
  helloName(name: 'john');

  describe();//it will take the default value, if there is no argument passed
  describe(something: null);//if you pass any value included null, it will take it
  describe(something: 'dart');

  describe2();//it will take the default value, if there is no argument passed
  describe2(something: 'flutter');//if you pass value, not null because it has to be valid string, it will take it

  //sayHelloTo();//it will throw error, because it is required parameter
  sayHelloTo(name: 'ali');//you always have to pass argument


  doSomethingWithAge(age: null);
  doSomethingWithAge(age: 20);


  desecribePerson();
  desecribePerson(name: 'john');
  desecribePerson(age: 20);
  desecribePerson(name: null);
  desecribePerson(age: null);
  desecribePerson(name: 'john', age: null);
  desecribePerson(name: null, age: 20);
  desecribePerson(name: 'john', age: 20);
  desecribePerson(age: 20, name: 'john');
  
}

void printWow(){
  print('wow');
}

//function ommited return type 
printHello() {//usually in the code base for big projects, we specify return type
  print('hello');
}//linter in dart will warn us if we ommited return type, but not enforce like other programming languages

//dynamic return type
dynamic doNothing() {}//every function reutrn null if we don't specify return value

//no return value, viod function is invoked for its side effect, not to create a variable to store the result
void doNothing2() {}//if we don't specify return type, it is will be void

//function with named parameter(always have value)
void helloName({String? name}){//named parameter is wrapped in curly braces, and can have default value, or optional
  print('hello $name');//but if it have an default value, you cannot pass null, because null is not valid stirng
}

//default parameter value, you can assign default value to named parameter whether they are optinal or not
void describe({String? something = '...'}){//it is optiona, if you don't pass argument, it will take the default value
  print('something :  $something');
}

//named paramter fucnitons don't have be nullable, if they have default value
//non optioanl named parameter with default value
void describe2({String something = '...'}){//if you don't pass argument, it will take the default value
  print('something :  $something');
}

//required parameter, you can make named parameter required by adding required keyword before parameter name
void sayHelloTo({required String name}){//if you don't pass argument, it will throw error
  print('hello $name');//you always have to pass argument 
}

//optionality of required parameter 
//named required parameter can be optional, but cannot have default value
void doSomethingWithAge({required int? age}){
  if (age != null) {
    final in2Years = age + 2;
    print('in 2 years you will be $in2Years');
  } else {
    print('you don\'t tell me age');
  }
}

//ordering of named parameter, paramters can be in any order, but you have to specify the name of the parameter
void desecribePerson({String? name, int? age}){//you can pass argument in any order
  print('name : $name, age : $age');
}

