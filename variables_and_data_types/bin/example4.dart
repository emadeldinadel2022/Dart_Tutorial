void main(List<String> args) {
  String name = 'Ali';
  var id = '';//can do var id = 0; because of type inference feature of var with dart know what is the data type ot assign for variable in the compialtion time
  id = name;
  print(name);
  print(id);
  
}