import 'package:flutter/material.dart';

import 'model.dart';

class SecondView extends StatelessWidget {
  String title = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(40),
              child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: "What are you going to do?",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal()),
                ),
                onChanged: (text) {
                  title = text;
                },
              ),
            ),
            Container(
              width: 120,
              height: 30,
              child: Row(
                children: [
                  FlatButton(
                      child: Text("+ ADD", style: TextStyle(fontSize: 20)),
                      onPressed: () {
                        Navigator.pop(
                            context,
                            TodoItem(
                                title: title, done: false));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
