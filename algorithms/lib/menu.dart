import 'package:flutter/material.dart';
import 'input.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<String> ListAlgo = [
    "Longest Common Subsequence",
    "Shortest Common Subsequence",
    "Levenshtein(Edit) Distance",
    "Longest Increasing Subsequence",
    "Matrix Chain Multiplication",
    "0-1 Knapsack",
    "Partition Problem",
    "Rod Cutting",
    "Coin Change Problem",
    "Word Break"
  ];
  void callAlgo(int opt) {
    print("called $opt");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AlgoMenu(opt)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Menu"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: ListAlgo.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int i) {
                return new ElevatedButton(
                    child: Center(child: Text("${ListAlgo[i]}")),
                    onPressed: () {
                      callAlgo(i);
                    });
              })),
    );
    // GridView.count(
    //     crossAxisCount: 3,
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //     children: [
    //       ElevatedButton(
    //         child: Text("LCS"),
    //         onPressed: () {
    //           callAlgo("LCS");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("SCS"),
    //         onPressed: () {
    //           callAlgo("SCS");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("LevenD"),
    //         onPressed: () {
    //           callAlgo("LevenD");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("LIS"),
    //         onPressed: () {
    //           callAlgo("LIS");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("MCM"),
    //         onPressed: () {
    //           callAlgo("MCM");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("01KSP"),
    //         onPressed: () {
    //           callAlgo("01KSP");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("PartP"),
    //         onPressed: () {
    //           callAlgo("PartP");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("RodC"),
    //         onPressed: () {
    //           callAlgo("RodC");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("Coin Change"),
    //         onPressed: () {
    //           callAlgo("CoinChangeP");
    //         },
    //       ),
    //       ElevatedButton(
    //         child: Text("WordBreak"),
    //         onPressed: () {
    //           callAlgo("WordBreak");
    //         },
    //       ),
    //     ]),
    // ),
    // );
  }
}
