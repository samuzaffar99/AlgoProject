import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  void callAlgo(String opt) {
    print("called $opt");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ElevatedButton(
                child: Text("LCS"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("SCS"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("Leven"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("LIS"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("MCM"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("MCM"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("01KSP"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("PartP"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("RodC"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("Coin Change"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
              ElevatedButton(
                child: Text("WordBreak"),
                onPressed: () {
                  callAlgo("lmao");
                },
              ),
            ]),
      ),
      //   FloatingActionButton(
      // onPressed: _incrementCounter,
      // tooltip: 'Increment',
      // child: Icon(Icons.add),
      // ),
    );
  }
}
