//single comment 

/*  multi line comment
    multi line comment
    multi line comment
*/

/// documentation comment
/**
 * documentation comment
 */
import 'dart:math';
void main(){
  print(10~/3); // ~/ is used to get integer value after division, truncating the decimal value
  print(sin(45*pi/180));
  print(cos(135*pi/180));
  print(sqrt(25));
  print(max(10,20));
  print(min(-2, 10));
  print(pow(2, 3));
  print(2.5.round());
  print(2.5.floor());
  print(2.5.ceil());
  //mini_exercise chapter 2
  print(sin(45 * pi / 180));
  print(1 / sqrt(2));

  //variables are objects in dart, all variables are references to objects int, double ref to num
  int age = 10;
  double degrees = 90.5;
  print(age.isEven);
  print(degrees.round());

  //type safety
  int a = 20;
  //a = 2.4; //error, because a is int type, dart is type-safe language
  //numeric type 
  num b = 20;
  b = 2.4;
  //dynamic type
  dynamic c = 20;
  c = 2.4;
  c = 'hello';
  //var
  var d = 20;
  //d = 2.4; //var is dynamic type, but once assigned, it cannot be changed to other type
  //const
  const e = 20;
  //e = 2.5; //error, const is compile time constant, cannot be changed
  //final
  final hoursSinceMidnight = DateTime.now().day;
  print(hoursSinceMidnight);
  //increment and decrement
  var counter = 0;
  print(counter++);
  print(++counter);
  print(counter--);
  print(--counter);
  print(counter+=1);
  print(counter-=1);

  double myValue = 10;
  myValue *= 3; // same as myValue = myValue * 3;
  // myValue = 30.0;
  myValue /= 2; // same as myValue = myValue / 2;
  // myValue = 15.0;

  const x = 46;
  const y = 10;
  const answer1 = (x * 100) + y;
  const answer2 = (x * 100) + (y * 100);
  const answer3 = (x * 100) + (y / 10);

  const aa = 2.0;
  const bb = 3.0;
  const cc = 1.0;
  final root1 = (-bb + sqrt(bb * bb - 4 * aa * cc)) / (2 * a);
  final root2 = (-bb - sqrt(bb * bb - 4 * aa * cc)) / (2 * a);
  print(root1);
  print(root2);
}