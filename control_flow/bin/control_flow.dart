//control flow is the order in which the computer executes statements in a script, control the flow of your data in your program
//it called control flow take the control from lines into another lines, only if condtions is valid/true
import 'dart:io';
void main(List<String> args){
  //condtional statements if, else if, else
  const yourName =  'Sandra';
  const myName = 'Elijah';

  if(yourName == myName){
    print('We have the same name');
  }else if(yourName == 'Sandra'){
    print('Hello $yourName');
  }else if (yourName == 'sandra' && myName == 'Elijah'){
    print('I am $myName, and your are $yourName');
  }else{
    print('Something Else');
  }


  //classic for loops, rarely used in todays
  const names = ['Elijah', 'Sandra', 'Eli', 'Sandy'];
  for(var i = 0; i < names.length; i++){
    print(names[i]);
  } 

  //reversed for loop
  for (var i = names.length - 1; i >= 0; i--){
    print(names[i]);
  }
  //you can have more block of code inside your conditions and loops to perfom some statements

  for (var i = 0; i < names.length; i += 2){
    print(names[i]);
  }

  //modern for loop, usually lose acces to the index, or counter, sometimes you need it
  const jobs = ['Developer', 'Designer', 'Engineer', 'Doctor'];
  
  for (final job in jobs){
    print(job);
  }
  //in modern for loop you have acces to some keywords like contunie, break
  for (final job in jobs){
    if(job.startsWith('D')){
      continue;
    }
    print(job);
  } 

  //optimize for privous for loop
  for (final job in jobs){
    if(!job.startsWith('D')){
      print(job);
    }
  }

  //using break
  for (final job in jobs){
    if(job == 'Engineer'){
      break;
    }
    print(job);
  }

  //modern for loop are more intellignet to know that the doctor is the last element in the list
  for (final job in jobs){
    if(job == 'Doctor'){
      continue;
    }
    print(job);
  }

  //backword modern for loop
  for (final job in jobs.reversed){
    print(job);
  }

  //counter with classic for loop
  for (var i = 0; i < 10; i++){
    print(i);
  }

  //counter with modern for loop
  for (final i in Iterable.generate(10)){
    print(i);
  }

  //index integer
  for (int i in Iterable.generate(20, (i) => i * 2)){
    print(i);
  }


  //for each loop, you can use it to loop through a list, map, set, or any iterable
  const info = {
    'name': 'Elijah',
    'age': 20,
    'job': 'Developer',
    'address': {
      'street': '123 Main Street',
      'city': 'Nairobi',
      'country': 'Kenya'
    }
  };

  info.forEach((key, value) {
    print('$key: $value');
  });

  for (final entry in info.entries){
    print('${entry.key}: ${entry.value}');
  }

  for (var i = 0; i < info.length; i++){
    print("${info.keys.elementAt(i)} + ': ' + ${info.values.elementAt(i).toString()}");
  }

  //while loop
  const food = ['Rice', 'Beans', 'Ugali', 'Chapati'];
  var counter = 0;
  
  //that is the more common way to write while loop, and it's affect statement
  while (counter < food.length){
    print(food[counter]);
    counter++;
  }
  print('-------------------');
  counter = 0;
  while (counter < food.length){
    print(food[counter++]);//you have a side affect.
  }
  print('-------------------');
  try{
    counter = 0;
    while (counter < food.length){
      print(food[++counter]);//throw an error, becuase it not assign ot any thing, incrment immediately
    }
  }catch(e){
    print(e);
  }
  print('-------------------');//aviod to writ your code like that

  counter = 0;
  try{//aviod to write your code like that
    while (counter++ < food.length){//throw an error, becuase it not assign ot any thing, incrment immediately
      print(food[counter]);//when get to the last element, it will increment after comparison, and then go to body
    }
  }catch(e){
    print(e);
  }
  print('-------------------');
  counter = -1;
  while (++counter < food.length){//the while loop itself is control counter variable, but make code more cryptic
    print(food[counter]);
  }
  print('-------------------');
  //reverse while loop
  counter = food.length;
  while (--counter >= 0){
    print(food[counter]);
  }
  print('-------------------');
  //do while loop
  counter = 0;
  do{
    print(food[counter]);
    counter++;
  }while (counter < food.length);
  print('-------------------');
  counter = 0;
  do{
    print(food[counter++]);
  }while (counter < food.length);
  print('-------------------');
  counter = -1;
  do{
    print(food[++counter]);
  }while (counter < food.length - 1);//-1 because it will increment before comparison
  print('-------------------');//reversed do while loop
  counter = food.length;
  do{
    print(food[--counter]);
  }while (counter > 0);

  //do while loop with break, continue
  print('-------------------');
  counter = 0;
  do{
    if(food[counter] == 'Ugali'){
      break;
    }
    print(food[counter]);
    counter++;
  }while (counter < food.length);

  print('-------------------');

  counter = 0;
  do{
    final f = food[counter++];
    if(f == 'Ugali'){
      continue;
    }
    print(f);
  }while (counter < food.length);

  //do while loop is used when you want to run your code at least once, and then check the condition
  //while loop is used when you want to check the condition first, and then run your code
  //for loop is used when you want to run your code for a specific number of times
  //for each loop is used when you want to loop through a list, map, set, or any iterable
  
  //switch statement
  const day = 1;
  switch (day){
    case 1:
      print('Monday');
      break;
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday');
      break;
    case 4:
      print('Thursday');
      break;
    case 5:
      print('Friday');
      break;
    case 6:
      print('Saturday');
      break;
    case 7:
      print('Sunday');
      break;
    default:
      print('Invalid Day');
  }

  //ternary operator
  const isTrue = true;
  const isFalse = false;
  const isNull = null;
  //ternary operator is a short hand for if else statement
  //condition ? true : false
  print(isTrue ? 'Yes' : 'No');

  //switch
  describe('Elijah');
  describe(20);
  describe(20.0);
  describe(true);
  describe([]);
  describe({});
  describe(null);

  //endless loop and handle user input with integer
  do{
     stdout.write("Enter your age or type 'exit': ");
     final input = stdin.readLineSync();
     if(input == 'exit'){
       break;
     }else if ((input?.length ?? 0) == 0 || input == null){//add input null check, to ensure that input is not null
      stdout.writeln('Invalid Input try again!');
       continue;
     }
     //dart static analyzer understand that if we are here, input is not null
    final age = int.tryParse(input);//we don't use! mark to enforce that input variable is not null, because we have already check that
    
    if (age == null){
      stdout.writeln('Invalid Input try again!');
      continue;
      }

    switch(age){//age is guaranteed to be and integer, optional integer is gauraneteed to ben and integer
      case int a when a >= 10 && a <= 18:
        stdout.writeln('You are a teenager');
        break;
      case int a when a >= 19 && a <= 30:
        stdout.writeln('You are a youth');
        break;
      case int a when a >= 31 && a <= 50:
        stdout.writeln('You are an adult');
        break;
      default:
        stdout.writeln('You are $age years old');
    }

  }while (true);


  //endless loop and handle user input with String
   do{
     stdout.write("Enter your name or type 'exit': ");
     final input = stdin.readLineSync();
     if(input == 'exit'){
       break;
     }else if ((input?.length ?? 0) == 0 || input == null){
      stdout.writeln('Invalid Input try again!');
       continue;
     }
    
    switch(input.toLowerCase()){
      case String fChar when fChar.startsWith('e'):
        stdout.writeln('Your name starts with E');
        break;
      case String fChar when fChar.startsWith('s'):
        stdout.writeln('You name starts with S');
        break;
      case String fChar when fChar.startsWith('a'):
        stdout.writeln('You name starts with A');
        break;
      default:
        stdout.writeln('You name starts with ${input[0]}');
    }

  }while (true);
  
  
}

void describe<T>(T value){
  switch (T){//when you creating switch statement, that your switch statemet inclusive all your cases that can possibly happen
    case String:
      print('String');
      break;
    case int:
      print('int');
      break;
    case double:
      print('double');
      break;
    case bool:
      print('bool');
      break;
    case List:
      print('List');
      break;
    case Map:
      print('Map');
      break;
    case Set:
      print('Set');
      break;
    default:
      print('Other');
  }//if you haven't include all your cases, yous shouled include default case
}
