import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:my_app/dataToDo.dart';

import 'package:my_app/datahanterare.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'addToDOView.dart';

import 'ToDoWidget.dart';

import 'datahanterare.dart';

import 'dataToDo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Datahanterare())
      ], // TODODS TILL DATATHANTERARE
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodolistView(),
      ),
    );
  }
}

class TodolistView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Datahanterare>(
      builder: (context, datahanterare, child) => Scaffold(
          appBar: AppBar(title: Text('To-Do'), actions: [
            PopupMenuButton(
                onSelected: (value) {
                  datahanterare.setFilterBy(value);
                },
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text("All"), value: "All"),
                      PopupMenuItem(child: Text("Done"), value: "Done"),
                      PopupMenuItem(child: Text("Not Done"), value: "NotDone"),
                    ])
          ]),
          body: CreateRow(_filterList(datahanterare.getItemLista,
              datahanterare.getFilterBy)), // här FilterBY
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => addToDoView()));
            },
          )),
    );
  }

  List<ToDo> _filterList(List<ToDo> list, filterBy) {
    if (filterBy == "All") return list;
    if (filterBy == "Done")
      return list.where((item) => item.value == true).toList();
    else
      return list.where((item) => item.value == false).toList();
  }
}

class CreateRow extends StatelessWidget {
  final List list;

  CreateRow(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((item) => _toDoItem(context, item)).toList());
  }

  Widget _toDoItem(
    context,
    ToDo item,
  ) {
    return ListTile(
        leading: Checkbox(
          value: item.value,
          onChanged: (bool? newValue) {
            Provider.of<Datahanterare>(context, listen: false)
                .updatestate(item.id, item.getTitle, newValue);
          },
          activeColor: Color.fromARGB(255, 139, 126, 126),
          checkColor: Colors.white,
        ),
        title: Text(item.getTitle,
            style: item.value!
                ? TextStyle(decoration: TextDecoration.lineThrough)
                : TextStyle()), //FUNKTION
        trailing: IconButton(
            onPressed: () {
              Provider.of<Datahanterare>(context, listen: false)
                  .deletItem(item.id); // ta bort id om du vill kör koden
            },
            padding: EdgeInsets.all(20.0),
            icon: const Icon(Icons.delete_outline)));
  }
}
