import 'package:flutter/material.dart';

void main() {
  runApp(MyHomepage());
}

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses App'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('Chart'),
                  color: Colors.blue,
                  elevation: 5,
                ),
              ),
              Card(
                color: Colors.red,
                child: Text('List of TX'),
              )
            ]),
      ),
    );
  }
}
