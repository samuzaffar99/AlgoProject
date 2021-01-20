import 'dart:convert';
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
  // var seq2 = new List<int>();
  // var seq3 = new List<int>();
  // for (int i = 0; i < random.nextInt(90) + 10; i++) {
  //   seq2.add(random.nextInt(99) + 1);
  //   seq3.add(random.nextInt(99) + 1);
  // }
  // print(seq2);
  // print(seq3);

    var seq4 = new List<String>();
    String name="syedabdullahmuzaffar";
    for (int i = 0; i < random.nextInt(30) + 30; i++) {
      if(random.nextBool()){
        int start=random.nextInt(name.length);
        int end=start+(random.nextInt(name.length-start)%10);
        if(start==end){
          seq4.add(name[start]);
        }
        else{
          seq4.add(name.substring(start, end));
        }
      }
      else {
        seq4.add(String.fromCharCodes(List.generate(
            random.nextInt(5) + 1, (index) => random.nextInt(26) + 97)));
      }
    }
    print(jsonEncode(seq4));
  return 0;
}
