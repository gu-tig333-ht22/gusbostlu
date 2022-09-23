import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ToDoWidget.dart';
import 'package:my_app/addToDoView.dart';
import 'package:my_app/main.dart';

import 'package:http/http.dart' as http;

import 'package:my_app/dataToDo.dart';

import 'package:flutter/cupertino.dart';

import 'package:my_app/datahanterare.dart';

import 'dataToDo.dart';

// ÄNDRA NAMN TILL DATAHANTERARE
class Datahanterare extends ChangeNotifier {
  static String apiUrl = "https://todoapp-api.apps.k8s.gu.se/todos";
  static String apiKey = "?key=00a4ed53-64d8-440c-b09d-8b612f4d3a2d";

  List<ToDo> itemList = [];

  Datahanterare() {
    getFromServer();
  } // när vi startra appen första gången så byggs datahanteraren. / construktor

  List<ToDo> get getItemLista => itemList; // geter för lista med todos

  Future getFromServer() async {
    http.Response response = await http.get(Uri.parse("$apiUrl$apiKey"));

    createList(jsonDecode(response.body));
  }

  void createList(data) {
    itemList.clear();
    data.forEach((item) {
      itemList.add(ToDo(
        title: item["title"],
        id: item["id"],
        value: item["done"],
      ));
    });
    notifyListeners();
  }

  /*Future addItem(String newTitel) async {
    http.Response response = await http.post(Uri.parse("$apiUrl$apiKey")), body;
    ({"title": newTitel});

    createList(jsonDecode(response.body));
  }*/

  Future addItem(String newTitle) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$apiUrl$apiKey"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"title": newTitle}),
      );
      createList(jsonDecode(response.body));
    } catch (e) {
      print(e);
    }
  }

  void updatestate(String id, String title, bool? newValue) async {
    http.Response response = await http.put(
      Uri.parse("$apiUrl/$id$apiKey"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "title": title,
        "done": newValue,
      }),
    );

    createList(jsonDecode(response.body));
  }

  String _filterBy = "All";

  String get getFilterBy => _filterBy;

  Future deletItem(String id) async {
    http.Response response = await http.delete(Uri.parse("$apiUrl/$id$apiKey"));

    createList(jsonDecode(response.body));
  }

  /*void deletItem(ToDo) {
    itemList.remove(ToDo);
    notifyListeners();
  }*/

  /* void updatestate(ToDo item, bool? newValue) {
    item.setIsDone(newValue);
    notifyListeners();
  }*/

  /*void addItem(String newTitle) {
    itemList.add(ToDo(title: newTitle));

    notifyListeners();
  }*/

  void setFilterBy(String filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}
/*void addItem(String newItemName) {
    ToDo.add(Item(newItemName));
    notifyListeners();
  }*/
