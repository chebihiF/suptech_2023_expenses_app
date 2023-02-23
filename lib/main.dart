import 'package:flutter/material.dart';

void main() {
  runApp(MyHomepage());
}

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses App'),
      ),
      body: Column(children: <Widget>[
        Card(
          child: Text('Chart'),
        ),
        Card(
          child: Text('List of TX'),
        )
      ]),
    );
  }
}
