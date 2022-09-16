import 'dart:html';
import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaineView(),
    );
  }
}

class MaineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG333 TODO "),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_open),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          )
        ],
      ),
      body: _toDo(),
    );
  }

  Widget _toDo() {
    var list = [
      "äta",
      "sova",
      "dricka",
    ];

    return Stack(
      children: [
        ListView(
          children: list.map((item) => _checkboxRow(item)).toList(),
        ),
        Positioned(bottom: 40, right: 40, child: _plussButton(context))
      ],
    );
  }

  Widget _checkboxRow(text) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (val) {},
          ),
          Container(width: 20),
          Text(text),
          Expanded(
              child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                  ))),
        ],
      ),
    );
  }

  Widget _plussButton(context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(
          Icons.add_circle_rounded,
          color: (Colors.blue),
          size: 60,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG333 TODO "),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_open),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Thirdview()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 32),
            _textField(),
            //_list(),
            Container(
              height: 20,
            ),
            _addbutton(context),
          ],
        ),
      ),
    );
  }
}

Widget _textField() {
  return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "what are you going to do ?",
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ));
}

Widget _addbutton(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      OutlinedButton(
        onPressed: () {
          ;
        },
        child: Text(
          "+ Add ",
          style: TextStyle(fontSize: 23),
        ),
      ),
    ],
  );
}

class Thirdview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ThirdViewState();
  }
}

class ThirdViewState extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    var _counter = 0;
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("$_counter", style: TextStyle(fontSize: 36))),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _counter = _counter + 1;
            });
          }),
    );
  }
}
