import 'package:flutter/material.dart';
import 'package:my_app/dataToDo.dart';
import 'addToDoView.dart';

import 'dataToDo.dart';

class ToDoWidget extends StatelessWidget {
  final ToDo thingtodo;

  ToDoWidget(
    this.thingtodo,
  );

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(thingtodo.getTitle));
  }
}
