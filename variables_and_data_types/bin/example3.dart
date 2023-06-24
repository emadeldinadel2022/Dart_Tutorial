void main(List<String> args) {
  //vanilla variables (mutable)
  var address =  'Cairo';
  print(address);
  address = 'Alex';
  print(address);
  address = address.replaceAll('A','C');
  print(address);
}