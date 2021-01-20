import 'dart:math';

int main() {
  Random random = new Random();
  // String name="ABDULLAH";
  // String testString="";
  // for (int i=0;i<random.nextInt(70)+30;i++){
  //   testString+=name[random.nextInt(name.length)];
  // }
  // print(testString);
  // testString="";
  // for (int i=0;i<random.nextInt(70)+30;i++){
  //   testString+=name[random.nextInt(name.length)];
  // }
  // print(testString);

  // var seq= new List<int>();
  // for (int i=0;i<random.nextInt(70)+30;i++){
  //   seq.add(random.nextInt(90)+10);
  // }
  // print(seq);
  var seq2 = new List<int>();
  var seq3 = new List<int>();
  for (int i = 0; i < random.nextInt(90) + 10; i++) {
    seq2.add(random.nextInt(99) + 1);
    seq3.add(random.nextInt(99) + 1);
  }
  print(seq2);
  print(seq3);
  return 0;
}
