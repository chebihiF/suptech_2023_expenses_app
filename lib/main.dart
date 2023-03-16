import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHomepage());
}

class MyHomepage extends StatelessWidget {
  void startAddNewTransaction(BuildContext Ctx) {
    showModalBottomSheet(
        context: Ctx,
        builder: (_) {
          return NewTransaction();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses App'),
          actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.add))],
        ),
        body: SingleChildScrollView(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                UserTransaction(),
                FloatingActionButton(
                  onPressed: () => {},
                  child: Icon(Icons.add),
                )
              ]),
        ),
      ),
    );
  }
}
