import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> list;

  TodoList(this.list);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((item) {
      return _todoitem(context, item);
    }).toList());
  }

  Widget _todoitem(context, item) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 330,
                height: 60,
                child: Row(
                  children: [
                    Checkbox(
                      value: item.completionstatus,
                      onChanged: (bool value) {
                        var state =
                            Provider.of<MyState>(context, listen: false);
                        state.changeCompletionStatus(item);
                      },
                    ),
                    if (item.completionstatus)
                      Text(
                        item.todoname,
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.lineThrough),
                      )
                    else
                      Text(
                        item.todoname,
                        style: TextStyle(fontSize: 20),
                      ),
                  ],
                ),
              ),
              Container(
                child: FlatButton(
                    child: (Icon(Icons.clear, size: 30)),
                    onPressed: () {
                      var state = Provider.of<MyState>(context, listen: false);
                      state.removeItem(item);
                    }),
                width: 50,
              ),
            ],
          ),
          Container(
            color: Colors.grey,
            height: 1,
          ),
        ],
      ),
    );
  }
}
