
void main(List<String> args) {
  //simple integer operations(Arithmetic operators)
  const age1 = 10;
  const age2 = 20;
  print(age1 + age2);//+plus operator is different in nature in dart
  print(age1 - age2);//same the function operator nautre like plus operator
  print(age1 * age2);//same the function operator nautre like plus operator
  print(age1 / age2);//same the function operator nautre like plus operator
  print(age1 ~/ age2);//same the function operator nautre like plus operator, truncate division result is integer
  print(age1 % age2);//same the function operator nautre like plus operator

  //unery prefix operators apply on single operand before the operand
  int age3 = 30;
  print(--age3);//decrement operator, executing like -minus operator
  print(++age3);//increment operator, executing like +plus operator 
  print(!true);//logical not operator
  const isMale = true;
  print(!isMale);
  print(!false);
  print(~1);//unary bitwise completment prefix operator flip all bits of the operand
  ///[000 000] [101 010]
  ///[111 111] [010 101]
  print(-age3);//return the negated value, not modify the value of the operand


  //unery postfix operators apply on single operand after the operand
  var age4 = 40;
  print(age4++);//increment operator, executing like +plus operator
  print(age4);
  print(age4--);//decrement operator, executing like -minus operator
  print(age4);

  //binary infix operator, not modify the value of the operand, just calculate the value and return the final resulr
  print(age4 + 20);
  print(age4 - 20);
  print(age4 * 20);
  print(age4 / 20);
  print(age4 ~/ 20);
  print(age4 % 20);
  //with comparison operator
  print(age4 == 20);
  print(age4 != 20);
  print(age4 > 20);
  print(age4 < 20);
  print(age4 >= 20);
  print(age4 <= 20);

  //bitwise infix operator
  print(101 & 010);//bitwise AND operator
  print(101 | 010);//bitwise OR operator
  print(101 ^ 010);//bitwise XOR operator
  print(101 << 2);//bitwise left shift operator
  print(101 >> 2);//bitwise right shift operator


  //Type promotion in operators
  const int1 = 1;
  const double1 = 1.0;
  const result = int1 + double1;//int promoted to double
  print(result);

  //compound assignment operators
  int age5 = 50;
  age5 += 10;//age5 = age5 + 10;
  print(age5);
  age5 -= 10;//age5 = age5 - 10;
  print(age5);
  age5 *= 10;//age5 = age5 * 10;
  print(age5);
  double age6 = 60.0;
  age6 /= 10;//age5 = age5 / 10;
  print(age6); 
  age5 ~/= 10;//age5 = age5 ~/ 10;
  print(age5);
  age5 %= 10;//age5 = age5 % 10;
  print(age5);
  age5 &= 10;//age5 = age5 & 10;
  print(age5);
  age5 |= 10;//age5 = age5 | 10;
  print(age5);
  age5 ^= 10;//age5 = age5 ^ 10;
  print(age5);
  age5 <<= 10;//age5 = age5 << 10;
  print(age5);
  age5 >>= 10;//age5 = age5 >> 10;
  print(age5);

  //Logical operators
  const satisfied = true;
  const qaulityGood = false;
  print(satisfied && qaulityGood);//logical AND operator
  print(satisfied || qaulityGood);//logical OR operator
  print(!satisfied);//logical NOT operator  



}