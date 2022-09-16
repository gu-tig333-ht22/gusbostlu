import 'dart:html';

import 'dart:js';

import 'dart:ui';

import './ThirdView.dart';

import 'SecondView.dart';

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
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          )
        ],
      ),
      body: _toDo(context),
    );
  }

  Widget _toDo(context) {
    var list = [
      "äta",
      "sova",
      "dricka",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ListView(
            children: list.map((item) => _checkboxRow(item)).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _plussButton(context),
        )
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
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {},
                  ))),
        ],
      ),
    );
  }

  Widget _plussButton(context) {
    return IconButton(
      icon: Icon(
        Icons.add,
        color: (Colors.blue),
        size: 60,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondView()));
      },
    );
  }
}
