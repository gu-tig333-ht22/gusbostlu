import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ToDoWidget.dart';
import 'package:my_app/addToDoView.dart';
import 'package:my_app/main.dart';
import 'dataToDo.dart';

import 'package:my_app/dataToDo.dart';

import 'package:flutter/cupertino.dart';

import 'package:my_app/datahanterare.dart';

// ÄNDRA NAMN TILL DATAHANTERARE
class Datahanterare extends ChangeNotifier {
  List<ToDo> itemList = [
    ToDo(message: "skriv en bok "),
    ToDo(message: "skriv en postIt ")
  ];

  List<ToDo> get getItemLista => itemList;

  String _filterBy = "All";

  String get getFilterBy => _filterBy;

  void deletItem(ToDo) {
    itemList.remove(ToDo);
    notifyListeners();
  }

  void updatestate(ToDo item, bool? newValue) {
    item.setIsDone(newValue);
    notifyListeners();
  }

  void addItem(String newMessage) {
    itemList.add(ToDo(message: newMessage));

    notifyListeners();
  }

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
/*void addItem(String newItemName) {
    ToDo.add(Item(newItemName));
    notifyListeners();
  }*/
