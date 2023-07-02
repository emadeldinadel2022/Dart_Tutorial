//maps are key value pairs

void main(List<String> args) {
  final info = {
    'name': 'John',
    'surname': 'Doe',
    'age': 30,
    'height': 1.80,
    'isMarried': false,
    'hobbies': ['running', 'swimming', 'hiking']
  };
  print(info);
  print(info['name']);
  print(info['age']);

  print(info.keys);
  print(info.values); 

  //add new key value pair
  print("=========================================");
  info['weight'] = 80;
  print(info);

  //remove key value pair
  print("=========================================");
  info.remove('weight');
  print(info);

  //update key value pair
  print("=========================================");
  info['age'] = 31;
  print(info);

  //add exist key
  print("=========================================");
  info.putIfAbsent('height', () => 1.75);//this key was not absent, so it will not be added, that is present
  print(info);

  //iterate throw map
  print("=========================================");
  for (final entry in info.entries){
    print(entry.key);
    print(entry.value);
  }

  //search map key
  print("=========================================");
  print(info.containsKey('name'));
  if (info.containsKey('name')){
    print('name is ${info['name']} in the map');
  } else {
    print('name is not in the map');
  }

  //search map value
  print("=========================================");
  print(info.containsValue('John'));
  if (info.containsValue('John')){
    print('John is in the map');
  } else {
    print('John is not in the map');
  }

  //sort map by key
  print("=========================================");
  final sortedKeys = info.keys.toList()..sort();  
  print(sortedKeys);

  //sort map by value
  print("=========================================");
  try{//if it's all same data type not return error
    final sortedValues = info.values.toList()..sort();
    print(sortedValues);
  } catch (e){
    print(e);
  }

  //return null if key does not exist
  print("=========================================");
  print(info['weight']);

}