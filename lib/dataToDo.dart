import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ToDo {
  late String _message;

  bool? _value = false;

  bool? _delet = false;

  ToDo({required String message}) {
    this._message = message;
  }

  String get getMessage => _message;

  bool? get value => _value;

  bool? get delet => _delet;

  setMessage(
    String newMessage,
  ) {
    _message = newMessage;
  }

  setIsDone(bool? newValue) {
    _value = newValue;
  }
}
