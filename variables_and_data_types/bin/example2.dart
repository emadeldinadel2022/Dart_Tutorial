void main(List<String> args) {
  //final
  final age = [1, 2, 3];
  print(age);
  //fial apply one type of immutability
  //age = [1, 2, 3, 4];
  age.removeAt(0);
  print(age);
}