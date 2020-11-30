import 'package:flutter/material.dart';
import 'package:myapp/remotedatahandler.dart';

class TodoItem {
  String id;
  String title = "default";
  bool done = false;
  TodoItem.constructor1({this.title, this.done});
  TodoItem.constructor2({this.id, this.title, this.done});
}

class MyState extends ChangeNotifier {
  List<TodoItem> _list = [];
  List<TodoItem> donelista;
  List<TodoItem> notdonelista;

  MyState() {
    setList();
  }

  void setList() async {
    int listlength = await RemoteDataHandler.getLengthOfList();

    for (int i = 0; i < listlength; i++) {
      String id = await RemoteDataHandler.getId(i);
      String title = await RemoteDataHandler.getTitle(i);
      bool done = await RemoteDataHandler.getDone(i);
      _list.add(TodoItem.constructor2(id: id, title: title, done: done));
    }
    notifyListeners();
  }

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

  void changeDone(TodoItem item) async {
    if (item.done) {
      item.done = false;
    } else
      item.done = true;
    await RemoteDataHandler.updateTodo(item.id, item.title, item.done);
    notifyListeners();
  }

  void updateLists() {
    donelista = new List<TodoItem>.from(_list);
    notdonelista = new List<TodoItem>.from(_list);

    for (int i = 0; i < list.length; i++) {
      for (int j = 0; j < donelista.length; j++) {
        if (donelista[j].done == false) donelista.removeAt(j);
      }
    }

    for (int m = 0; m < list.length; m++) {
      for (int n = 0; n < notdonelista.length; n++) {
        if (notdonelista[n].done) notdonelista.removeAt(n);
      }
    }
  }
}
