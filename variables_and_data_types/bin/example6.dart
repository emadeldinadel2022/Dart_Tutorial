void main(List<String> args) {
  const int yoyurAge = 20;
  const myAge = 20;
  //same type reference
  print(yoyurAge);
  print(myAge);

  const myList = [1, 2, 3];
  //myList.add(4);//error
  final myList2 = [1, 2, 3];
  myList2.add(4);
  print(myList2);

  //Late variables
  late final v = 10;
  print(v);
  late final value = getValue();//getValue() will not be called until the variable value is used
  print('we are here');
  print(value);

  //data types
  int age = 20;//less precision
  double height = 1.8;//more precision
  String name = 'Ali';
  bool isMale = true;
  List<int> ages = [1, 2, 3];
  Map<String, int> agesMap = {'Ali': 20, 'Ahmed': 30};
  Set<int> agesSet = {1, 2, 3};//like list but without duplicate values
  dynamic someNullValue = null;
  Symbol symbol = #someNullValue;//symbol is a data type that represent the name of variable or function, or reference to a function or variable



  //type promotion
  final double hisAge = 20;
  //error fian lin hisAge = 20.3 ;

  //speciify data types
  const String myName = 'Ali';//specify data type
  final hisName = myName;//not specify data type use type inference

  
 
}

int getValue(){
  print('getValue Called');
  return 10;
}