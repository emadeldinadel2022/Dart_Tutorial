// ignore_for_file: unused_local_variable

void main(List<String> args) {
  //constants that canot assing to non-constant variables\
  //cost vars can assign to final vars, but not vice versa
  //const is more accruate than final, final is half accureate
  const age2 = 22;
  final age = age2;

  final age3 = 22;
  //const age4 = age3; error

}