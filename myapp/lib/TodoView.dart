import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SecondView.dart';
import 'TodoLists.dart';
import 'model.dart';

class TodoView extends StatelessWidget {
  String sortingchoice = "all";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert),
            iconSize: 36,
            underline: SizedBox(),
            items: [
              DropdownMenuItem(
                child: Text("all"),
                value: "all",
              ),
              DropdownMenuItem(
                child: Text("done"),
                value: "done",
              ),
              DropdownMenuItem(child: Text("undone"), value: "notdone"),
            ],
            onChanged: (value) {
              sortingchoice = value;
              Provider.of<MyState>(context, listen: false).notifyListeners();
            },
          ),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) {
          if (sortingchoice == "done")
            return TodoList(state.donelist);
          else if (sortingchoice == "notdone")
            return TodoList(state.notdonelist);
          else
            return TodoList(state.list);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondView()),
          );
          if (newItem != null) {
            Provider.of<MyState>(context, listen: false).addItem(newItem);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
