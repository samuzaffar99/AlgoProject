import 'package:flutter/material.dart';
import 'algorithms/1-LCS.dart';
import 'dart:io';
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
    if(widget.opt=="LCS" || widget.opt=="SCS" || widget.opt=="LevenD"){
      var path = "assets/inputs/abc/${input}.csv";
      Future<String> data = loadAsset(path);
      LineSplitter ls = new LineSplitter();
      String X,Y;
      var result = await data;
      List<String> result2= ls.convert(result);
      print(result2);
      X=result2[0];
      Y=result2[1];
      // if(input==1){
      //
      //   X="HBLBDADBADABABDLLUDDUHALHDLAHALLABDHUHLHLHAH";
      //   Y="LLUBDAHUHLLABDALLBUDUAHHLBDDBAHAAALAUU";
      // }
      // else if(input==2){
      //   X="LLUBDAHUHLLABDALLBUDUAHHLBDDBAHAAALAUU";
      // }
      if(widget.opt=="LCS" || widget.opt=="SCS" || widget.opt=="LevenD"){
        callLCS(X,Y);
      }
      else if(widget.opt=="LCS" || widget.opt=="SCS" || widget.opt=="LevenD"){
        //callSCS(X,Y);
      }
      else if(widget.opt=="LCS" || widget.opt=="SCS" || widget.opt=="LevenD"){
        //callLevenD(X,Y);
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
