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
    String InputText;
    String OutputText;
    var path = "assets/inputs/";
    LineSplitter ls = new LineSplitter();
    print(widget.opt);
    //abc
    if (widget.opt == "LCS" || widget.opt == "SCS" || widget.opt == "LevenD") {
      path += "abc/${input}.csv";
      var result = await loadAsset(path);
      print("File Contents: $result");
      InputText = result;

      String X, Y;
      List<String> result2 = ls.convert(result);
      print(result2);
      X = result2[0];
      Y = result2[1];
      if (widget.opt == "LCS") {
        OutputText = callLCS(X, Y);
      } else if (widget.opt == "SCS") {
        OutputText = callSCS(X, Y);
      } else if (widget.opt == "LevenD") {
        OutputText = callLevenD(X, Y);
      }
    }
    //degi
    else if (widget.opt == "LIS" ||
        widget.opt == "MCM" ||
        widget.opt == "PartP" ||
        widget.opt == "CoinChangeP") {
      path += "degi/${input}.csv";
      var result = await loadAsset(path);
      print("File Contents: $result");
      InputText = result;

      var result2 = json.decode("[" + result + "]").cast<int>();
      print(result2);
      print("Result2 is: $result2");
      if (widget.opt == "LIS") {
        OutputText = callLIS(result2);
      } else if (widget.opt == "MCM") {
        OutputText = callMCM(result2);
      } else if (widget.opt == "PartP") {
        OutputText = callPartP(result2);
      } else if (widget.opt == "CoinChangeP") {
        OutputText = callCoinChangeP(result2, 169);
      }
    }
    //fh
    else if (widget.opt == "01KSP" || widget.opt == "RodC") {
      List<int> param1;
      List<int> param2;
      int param3 = 169;
      if (input == 0) {
        //generate
      } else {
        path += "fh/${input}.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");
        InputText = result;

        List<String> result2 = ls.convert(result);
        param1 = json.decode(result2[0]).cast<int>();
        param2 = json.decode(result2[1]).cast<int>();
      }
      if (widget.opt == "01KSP") {
        OutputText = call01KP(param1, param2, param3);
      } else if (widget.opt == "RodC") {
        OutputText = callRodC(param1, param2, param3);
      }
    }
    //j
    else if (widget.opt == "WordBreak") {
      List<String> param1;
      String param2 = "syedabdullahmuzaffar";
      if (input == 0) {
        //generate
      } else {
        path += "j/${input}.csv";
        var result = await loadAsset(path);
        print("File Contents: $result");
        InputText = result;

        param2 = json.decode(result);
      }
      if (widget.opt == "WordBreak") {
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
              child: Text("Generate Input"),
              onPressed: () {
                runAlgo(0);
              },
            ),
            Card(),
            Text("Input: $Input"),
            Text("Output: $Output"),
          ]),
        ));
  }
}
