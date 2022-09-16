import 'dart:js';

import 'package:flutter/material.dart';

import 'package:my_app/main.dart';
import 'package:provider/provider.dart';

import 'dataToDo.dart';

import 'datahanterare.dart';

class addToDoView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Thing To-Do"),
      ),
      body: Column(
        children: [
          //TodoWidget(ToDo),
          Container(height: 36),
          _textField(context),
        ],
      ),
    );
  }
}

TextEditingController userInput = TextEditingController();

Widget _textField(context) {
  return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        controller: userInput,
        decoration: InputDecoration(
          hintText: "what are you going to do ?",
          suffixIcon: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<Datahanterare>(context, listen: false)
                  .addItem(userInput.text);
              Navigator.pop(context);
            },
          ),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ));
}
