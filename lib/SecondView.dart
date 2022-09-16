import 'package:flutter/material.dart';
import './ThirdView.dart';

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
