import 'package:flutter/material.dart';

class TodoItem {
  String todoname = "default";
  bool completionstatus = false;
  TodoItem({this.todoname, this.completionstatus});
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [
    TodoItem(todoname: "sova", completionstatus: false),
    TodoItem(todoname: "vakna", completionstatus: true),
    TodoItem(todoname: "bädda", completionstatus: false),
    TodoItem(todoname: "städa", completionstatus: true),
  ];

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

  void addItem(TodoItem item) {
    _list.add(item);
    notifyListeners();
  }

  void removeItem(TodoItem item) {
    _list.remove(item);
    notifyListeners();
  }

  void changeCompletionStatus(TodoItem item) {
    if (item.completionstatus) {
      item.completionstatus = false;
    } else
      item.completionstatus = true;
    notifyListeners();
  }

  void updateLists() {
    donelista = new List<TodoItem>.from(_list);
    notdonelista = new List<TodoItem>.from(_list);

    for (int i = 0; i < list.length; i++) {
      for (int j = 0; j < donelista.length; j++) {
        if (donelista[j].completionstatus == false) donelista.removeAt(j);
      }
    }

    for (int m = 0; m < list.length; m++) {
      for (int n = 0; n < notdonelista.length; n++) {
        if (notdonelista[n].completionstatus) notdonelista.removeAt(n);
      }
    }
  }
}
