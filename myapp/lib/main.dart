import 'package:flutter/material.dart';
import 'package:myapp/remotedatahandler.dart';
import 'package:provider/provider.dart';

import 'TodoView.dart';
import 'model.dart';

void main() {
  var state = MyState();
  //RemoteDataHandler.removeTodo("7da44e15-a3ea-49d3-9395-02376d80e5cb");
  runApp(
    ChangeNotifierProvider(create: (context) => state, child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo app",
      home: TodoView(),
    );
  }
}
