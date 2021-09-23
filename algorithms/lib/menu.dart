import 'package:flutter/material.dart';
import 'input.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List<String> listAlgo = [
    "A- Longest Common Subsequence",
    "A- Shortest Common Supersequence",
    "A- Levenshtein(Edit) Distance",
    "B- Longest Increasing Subsequence",
    "B- Matrix Chain Multiplication",
    "C- 0-1 Knapsack",
    "B- Partition Problem",
    "C- Rod Cutting",
    "B- Coin Change Problem",
    "D- Word Break"
  ];
  void callAlgo(int opt) {
    print("called $opt");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AlgoMenu(opt, listAlgo[opt])),
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.primaries[1],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Select an Algorithm",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                    itemCount: listAlgo.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int i) {
                      return new ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            //side: BorderSide(color: Colors.purpleAccent, width: 2),
                          ),
                          child: Center(child: Text("${listAlgo[i]}")),
                          onPressed: () {
                            callAlgo(i);
                          });
                    }),
              ),
              //Spacer(),
              Center(
                child: Text(
                  "Developed by\n Syed Abdullah Muzaffar",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12,color: Colors.black.withOpacity(0.6)),
                ),
              ),
              SizedBox(height: 12),
            ],
          )),
    );
  }
}
