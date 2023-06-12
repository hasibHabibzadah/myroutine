import 'dart:html';

import 'package:myroutine/model/todo.dart';

class ToDO{
  public String? id;
  String? todoText;
  bool isDone;

  ToDO({
    required this.id,
    required this.todoText,
    this.isDone = false

});

  static List<ToDo> todoList() {
    return [
    ToDo(id : '01', todoText : 'Morning exercise', isDone = true);

    ];
  }

}
