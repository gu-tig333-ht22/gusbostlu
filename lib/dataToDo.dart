import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ToDo {
  late String _title;

  String id = "";

  bool? _value = false;

  ToDo(
      {required String title,
      required String id,
      bool value = false,
      bool delete = false}) {
    this._title = title;
    this.id = id;
    this._value = value;
  }

  String get getTitle => _title;

  bool? get value => _value;

  setTitle(
    String newTitle,
  ) {
    _title = newTitle;
  }

  setIsDone(bool? newValue) {
    _value = newValue;
  }
}
