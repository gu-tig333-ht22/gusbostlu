import 'dart:html';

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
  //BuildContext get context => null;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do list "),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
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
            _nameLable(),
            Container(height: 24),
            _checkboxRow(),
            Container(height: 24),
            _buttonRow(context),
          ],
        ),
      ),
    );
  }

  Widget _nameLable() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 24),
      child: Text("Things to Do "),
    );
  }

  Widget _checkboxRow() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Container(width: 20),
        Text("Read a book"),
        Expanded(
            child: Align(
                alignment: Alignment.topRight, child: Icon(Icons.delete))),
      ],
    );
  }

  Widget _buttonRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
          },
          child: Text("Add things to do !"),
        ),
      ],
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 32),
            _textField(),
            _list(),
          ],
        ),
      ),
    );
  }
}

Widget _list() {
  var toDo = ["Läsa en bok ", " Mata farmors groda"];

  var list = toDo;
  return ListView(
    children: list.map((item) => _item(item)).toList(),
  );
}

Widget _item(text) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Text(text, style: TextStyle(fontSize: 100)),
  );
}

/*Widget _nameLable() {
  return Container(
    margin: EdgeInsets.only(left: 16, top: 24),
    child: Text("Add a thing to do"),
  );
}*/

Widget _textField() {
  return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "what are you going to do ?",
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ));
}
