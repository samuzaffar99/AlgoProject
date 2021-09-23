import 'dart:math';
import 'package:flutter/material.dart';
import 'package:algorithms/algorithms_abc.dart';
import 'package:algorithms/algorithms_degi.dart';
import 'package:algorithms/algorithms_fh.dart';
import 'package:algorithms/algorithms_j.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AlgoMenu extends StatefulWidget {
  final int opt;
  final String title;
  const AlgoMenu(this.opt,this.title);
  @override
  _AlgoMenuState createState() => _AlgoMenuState();
}

class _AlgoMenuState extends State<AlgoMenu> {
  String textInput;
  String textOutput;
  String textTime;
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void runAlgo(int input) async {
    final stopwatch = new Stopwatch();
    Random random = new Random();
    String inputText;
    String outputText;
    var path = "assets/inputs/";
    LineSplitter ls = new LineSplitter();
    print(widget.opt);
    //List<String> Codes=["LCS","SCS","LevenD","LIS","MCM","01KSP","PartP","RodC","CoinChangeP","WordBreak"];
    //abc
    if (widget.opt == 0 || widget.opt == 1 || widget.opt == 2) {
      String param1;
      String param2;
      if (input == 0) {
        //generate
        String name="ABDULLAH";
        param1="";
        param2="";
        for (int i=0;i<random.nextInt(70)+30;i++){
          param1+=name[random.nextInt(name.length)];
        }
        for (int i=0;i<random.nextInt(70)+30;i++){
          param2+=name[random.nextInt(name.length)];
        }
      }
      else {
        path += "abc/$input.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");

        List<String> result2 = ls.convert(result);
        print(result2);
        param1 = result2[0];
        param2 = result2[1];
      }
      stopwatch.start();
      if (widget.opt == 0) {
        inputText = "X: \"$param1\" \n\nY: \"$param2\"";
        outputText = callLCS(param1, param2);
      } else if (widget.opt == 1) {
        inputText = "X: \"$param1\" \n\nY: \"$param2\"";
        outputText = callSCS(param1, param2);
      } else if (widget.opt == 2) {
        inputText = "X: \"$param1\" \n\nY: \"$param2\"";
        outputText = callLevenD(param1, param2);
      }
    }

    //degi
    else if (widget.opt == 3 ||
        widget.opt == 4 ||
        widget.opt == 6 ||
        widget.opt == 8) {
      List<int> param1;
      int param2 = 169;
      if (input == 0) {
        //generate
        param1= <int>[];
        for (int i=0;i<random.nextInt(70)+30;i++){
          param1.add(random.nextInt(90)+10);
        }
        print(param1);
      } else {
        path += "degi/$input.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");

        param1 = json.decode("[" + result + "]").cast<int>();
        print(param1);
        print("Result2 is: $param1");
      }
      stopwatch.start();
      if (widget.opt == 3) {
        inputText = "Values: ${param1.toString()}";
        outputText = callLIS(param1);
      } else if (widget.opt == 4) {
        inputText = "Values: ${param1.toString()}";
        outputText = callMCM(param1);
      } else if (widget.opt == 6) {
        inputText = "Values: ${param1.toString()}";
        outputText = callPartP(param1);
      } else if (widget.opt == 8) {
        inputText = "Values: ${param1.toString()}\nChange: $param2";
        outputText = callCoinChangeP(param1, param2);
      }
    }

    //fh
    else if (widget.opt == 5 || widget.opt == 7) {
      List<int> param1;
      List<int> param2;
      int param3 = 169;
      if (input == 0) {
        //generate
        param1 = <int>[];
        param2 = <int>[];
        for (int i = 0; i < random.nextInt(90) + 10; i++) {
          param1.add(random.nextInt(99) + 1);
          param2.add(random.nextInt(99) + 1);
        }
      } else {
        path += "fh/$input.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");

        List<String> result2 = ls.convert(result);
        param1 = json.decode(result2[0]).cast<int>();
        param2 = json.decode(result2[1]).cast<int>();
      }
      stopwatch.start();
      if (widget.opt == 5) {
        //01Knapsack
        inputText = "Values: ${param1.toString()}\nWeights: ${param2.toString()}\nCapacity: $param3";
        outputText = call01KP(param1, param2, param3);
      } else if (widget.opt == 7) {
        //RodCutting
        inputText = "Prices: ${param1.toString()}\nLengths: ${param2.toString()}\nRod Length: $param3";
        outputText = callRodC(param1, param2, param3);
      }
    }

    //j
    else if (widget.opt == 9) {
      List<String> param1;
      String param2 = "syedabdullahmuzaffar";
      if (input == 0) {
        //generate
        param1  = <String>[];
        for (int i = 0; i < random.nextInt(30) + 30; i++) {
          if(random.nextBool()){
            int start=random.nextInt(param2.length);
            int end=start+(random.nextInt(param2.length-start)%10);
            if(start==end){
              param1.add(param2[start]);
            }
            else{
              param1.add(param2.substring(start, end));
            }
          }
          else {
            param1.add(String.fromCharCodes(List.generate(
                random.nextInt(5) + 1, (index) => random.nextInt(26) + 97)));
          }
        }
      } else {
        path += "j/$input.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");
        param1 = (jsonDecode(result) as List<dynamic>).cast<String>();
      }
      stopwatch.start();
      if (widget.opt == 9) {
        inputText = "Words: ${param1.toString()}\n\nName: $param2";
        outputText = callWordBreak(param1, param2);
      }
    } else {
      outputText = "Invalid Input/Option Selected";
    }
    stopwatch.stop();
    print("Time taken: ${stopwatch.elapsed}");
    setState(() {
      textTime = "Time taken: ${stopwatch.elapsed}";
      textInput = inputText;
      textOutput = outputText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text("Select Input",
              style: TextStyle(fontWeight: FontWeight.bold),),
            Container(
              decoration: BoxDecoration(border: Border(
                top: BorderSide(width: 1.0,),
                bottom: BorderSide(width: 1.0,),
              ),),
              padding: EdgeInsets.all(8.0),
              constraints: BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 11,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          //side: BorderSide(color: Colors.purpleAccent, width: 2),
                        ),
                        child:
                        (i!=0) ? Text("Input $i") : Text("Generate Random Input"),
                        onPressed: () {
                          runAlgo(i);
                        },
                      ),
                    );
                  }),
            ),
            SizedBox( height: 24.0, ),
            Container(
              width: double.infinity,
              child: Card(
                  elevation: 5,
                  color: Colors.primaries[1],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Input",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (textInput != null) Text("$textInput"),
                      ],
                    ),
                  )),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: Card(
                  elevation: 5,
                  color: Colors.primaries[1],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Output",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (textOutput != null) Text("$textOutput"),
                        Text(
                          "Time",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (textTime != null) Text("$textTime"),
                      ],
                    ),
                  )),
            ),
            SizedBox( height: 16.0, ),
          ]),
        ));
  }
}
