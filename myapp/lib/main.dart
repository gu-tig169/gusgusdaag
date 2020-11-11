import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TIG169 TODO"),
          actions: [
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        body: _list(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondView()),
            );
          },
          child: Icon(Icons.add),
        ));
  }

  Widget _list() {
    var todo = [
      "cykla",
      "bada",
      "sola",
      "tvätta",
    ];

    return ListView.builder(
      itemBuilder: (context, [index]) => _item(todo[index]),
      itemCount: todo.length,
    );
  }

  Widget _item(text) {
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
                      Checkbox(value: false),
                      Text(text, style: TextStyle(fontSize: 20))
                    ],
                  )),
              Container(
                child: (Icon(Icons.clear, size: 30)),
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

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TIG169 TODO"),
      ),
      body: Center(
        child: 
          Column(mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            Container(
              margin: EdgeInsets.all(40),
              child: TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: "What are you going to do?",
                    border: OutlineInputBorder(borderRadius: BorderRadius.horizontal()
                    ),
                  )
              ),
            ),
            Container(
              width: 80,
              height: 30,
              child: Row(
                children: [
                  Icon(Icons.add),
                  Text("ADD", style: TextStyle(fontSize: 20))
                ],
              )
            )
          ]
        ),
      )
    );
  }
}
