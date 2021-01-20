import 'dart:math';
import 'package:flutter/material.dart';
import 'package:algorithms/algorithms_abc.dart';
import 'package:algorithms/algorithms_degi.dart';
import 'package:algorithms/algorithms_fh.dart';
import 'package:algorithms/algorithms_j.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class AlgoMenu extends StatefulWidget {
  final String opt;
  const AlgoMenu(this.opt);
  @override
  _AlgoMenuState createState() => _AlgoMenuState();
}

class _AlgoMenuState extends State<AlgoMenu> {
  String Input;
  String Output;
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }

  void runAlgo(int input) async {
    Random random = new Random();
    String InputText;
    String OutputText;
    var path = "assets/inputs/";
    LineSplitter ls = new LineSplitter();
    print(widget.opt);

    //abc
    if (widget.opt == "LCS" || widget.opt == "SCS" || widget.opt == "LevenD") {
      String param1,param2;
      if (input == 0) {
        //generate
      }
      else {
        path += "abc/${input}.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");

        List<String> result2 = ls.convert(result);
        print(result2);
        param1 = result2[0];
        param2 = result2[1];
      }
      if (widget.opt == "LCS") {
        InputText = "X: \"$param1\" \n\nY: \"$param2\"";
        OutputText = callLCS(param1, param2);
      } else if (widget.opt == "SCS") {
        InputText = "X: \"$param1\" \n\nY: \"$param2\"";
        OutputText = callSCS(param1, param2);
      } else if (widget.opt == "LevenD") {
        InputText = "X: \"$param1\" \n\nY: \"$param2\"";
        OutputText = callLevenD(param1, param2);
      }
    }

    //degi
    else if (widget.opt == "LIS" ||
        widget.opt == "MCM" ||
        widget.opt == "PartP" ||
        widget.opt == "CoinChangeP") {
      List<int> param1;
      int param2 = 169;
      if (input == 0) {
        //generate
        param1= new List<int>();
        for (int i=0;i<random.nextInt(70)+30;i++){
          param1.add(random.nextInt(90)+10);
        }
        print(param1);
      } else {
        path += "degi/${input}.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");

        param1 = json.decode("[" + result + "]").cast<int>();
        print(param1);
        print("Result2 is: $param1");
      }
      if (widget.opt == "LIS") {
        InputText = "Values: ${param1.toString()}";
        OutputText = callLIS(param1);
      } else if (widget.opt == "MCM") {
        InputText = "Values: ${param1.toString()}";
        OutputText = callMCM(param1);
      } else if (widget.opt == "PartP") {
        InputText = "Values: ${param1.toString()}";
        OutputText = callPartP(param1);
      } else if (widget.opt == "CoinChangeP") {
        InputText = "Values: ${param1.toString()}\nChange: $param2";
        OutputText = callCoinChangeP(param1, param2);
      }
    }

    //fh
    else if (widget.opt == "01KSP" || widget.opt == "RodC") {
      List<int> param1;
      List<int> param2;
      int param3 = 169;
      if (input == 0) {
        //generate
        param1 = new List<int>();
        param2 = new List<int>();
        for (int i = 0; i < random.nextInt(90) + 10; i++) {
          param1.add(random.nextInt(99) + 1);
          param2.add(random.nextInt(99) + 1);
        }
      } else {
        path += "fh/${input}.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");

        List<String> result2 = ls.convert(result);
        param1 = json.decode(result2[0]).cast<int>();
        param2 = json.decode(result2[1]).cast<int>();
      }
      if (widget.opt == "01KSP") {
        InputText = "Values: ${param1.toString()}\nWeights: ${param2.toString()}\nCapacity: $param3}";
        OutputText = call01KP(param1, param2, param3);
      } else if (widget.opt == "RodC") {
        InputText = "Prices: ${param1.toString()}\nLengths: ${param2.toString()}\nCutLength: $param3}";
        OutputText = callRodC(param1, param2, param3);
      }
    }

    //j
    else if (widget.opt == "WordBreak") {
      List<String> param1;
      String param2 = "syedabdullahmuzaffar";
      if (input == 0) {
        //generate
        param1  = new List<String>();
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
        path += "j/${input}.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");
        param1 = (jsonDecode(result) as List<dynamic>).cast<String>();
      }
      if (widget.opt == "WordBreak") {
        InputText = "Words: ${param1.toString()}\n\nName: $param2";
        OutputText = callWordBreak(param1, param2);
      }
    } else {
      OutputText = "Invalid Input/Option Selected";
    }

    setState(() {
      Input = InputText;
      Output = OutputText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose Input"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text("Select Preset Input"),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 2.0)),
              padding: EdgeInsets.all(8.0),
              constraints: BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return ElevatedButton(
                      child: Text("Input ${i + 1}"),
                      onPressed: () {
                        runAlgo(i + 1);
                      },
                    );
                  }),
            ),
            ElevatedButton(
              child: Text("Generate Random Input"),
              onPressed: () {
                runAlgo(0);
              },
            ),
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
                        if (Input != null) Text("$Input"),
                      ],
                    ),
                  )),
            ),
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
                        if (Output != null) Text("$Output"),
                      ],
                    ),
                  )),
            ),
          ]),
        ));
  }
}
