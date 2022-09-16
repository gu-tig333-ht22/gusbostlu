import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Thirdview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThirdViewState();
  }
}

class ThirdViewState extends State<StatefulWidget> {
  int _counter = 0;
  Widget build(BuildContext context) {
    // här bygger man statetvidgeten
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("$_counter", style: TextStyle(fontSize: 36))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              // här brättar du för flutter att du ändrar statet
              _counter++;
            });
          }),
    );
  }
}
