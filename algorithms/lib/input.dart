import 'package:flutter/material.dart';
import 'package:algorithms/algorithms_abc.dart';
import 'package:algorithms/algorithms_degi.dart';
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
  Future<String> loadAsset(String path) async {
    return await rootBundle.loadString(path);
  }
  void runAlgo(int input) async{
    var path = "assets/inputs/";
    LineSplitter ls = new LineSplitter();
    print(widget.opt);
    //abc
    if(widget.opt=="LCS" || widget.opt=="SCS" || widget.opt=="LevenD"){
      path += "abc/${input}.csv";
      var result = await loadAsset(path);
      print("File Contents: $result");

      String X,Y;
      List<String> result2= ls.convert(result);
      print(result2);
      X=result2[0];
      Y=result2[1];
      if(widget.opt=="LCS"){
        callLCS(X,Y);
      }
      else if(widget.opt=="SCS"){
        callSCS(X,Y);
      }
      else if(widget.opt=="LevenD"){
        callLevenD(X,Y);
      }
    }
    //degi
    else if(widget.opt=="LIS" || widget.opt=="MCM" || widget.opt=="PartP" || widget.opt=="CoinChangeP"){
      path += "degi/${input}.csv";
      var result = await loadAsset(path);
      print("File Contents: $result");

      var result2=json.decode("[" +result + "]").cast<int>();
      print(result2);
      print("Result2 is: $result2");
      if(widget.opt=="LIS"){
        callLIS(result2);
      }
      else if(widget.opt=="MCM"){
        callMCM(result2);
      }
      else if(widget.opt=="PartP"){
        callPartP(result2);
      }
      else if(widget.opt=="CoinChangeP"){
        callCoinChangeP(result2,0169);
      }
    }

    //setState(){};
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
            ElevatedButton(
              child: Text("Input 1"),
              onPressed: () {
                runAlgo(1);
              },
            ),
            ElevatedButton(
              child: Text("Input 2"),
              onPressed: () {
                runAlgo(2);
              },
            ),
            ElevatedButton(
              child: Text("Generate Input"),
              onPressed: () {
                runAlgo(3);
              },
            ),
            Text("Input: "),
            Text("Output: "),
          ]),
        ));
  }
}
