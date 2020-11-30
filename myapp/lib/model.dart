import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/remotedatahandler.dart';

class TodoItem {
  String id;
  String title = "default";
  bool done = false;
  TodoItem({this.title, this.done});
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];

  List<TodoItem> donelista;
  List<TodoItem> notdonelista;

  List<TodoItem> get list {
    return _list;
  }

  List<TodoItem> get donelist {
    updateLists();
    return donelista;
  }

  List<TodoItem> get notdonelist {
    updateLists();
    return notdonelista;
  }

  void addItem(TodoItem item) async {
    await RemoteDataHandler.addTodo(item, item.title, false);
    item.id = await RemoteDataHandler.getLastId();
    _list.add(item);
    notifyListeners();
  }

  void removeItem(TodoItem item) async {
    await RemoteDataHandler.removeTodo(item.id);
    _list.remove(item);
    notifyListeners();
  }

  void changeDone(TodoItem item) {
    if (item.done
) {
      item.done
   = false;
    } else
      item.done
   = true;
    notifyListeners();
  }

  void updateLists() {
    donelista = new List<TodoItem>.from(_list);
    notdonelista = new List<TodoItem>.from(_list);

    for (int i = 0; i < list.length; i++) {
      for (int j = 0; j < donelista.length; j++) {
        if (donelista[j].done
     == false) donelista.removeAt(j);
      }
    }

    for (int m = 0; m < list.length; m++) {
      for (int n = 0; n < notdonelista.length; n++) {
        if (notdonelista[n].done
    ) notdonelista.removeAt(n);
      }
    }
  }
}
