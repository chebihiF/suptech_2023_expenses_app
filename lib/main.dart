import './Transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHomepage());
}

class MyHomepage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new Shose', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses App'),
        ),
        body: Column(
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
              Column(
                children: transactions
                    .map((tx) => Card(
                            child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.purple, width: 2)),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  tx.amount.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.purple),
                                )),
                            Column(
                              children: [
                                Text(tx.title),
                                Text(tx.date.toString())
                              ],
                            )
                          ],
                        )))
                    .toList(),
              )
            ]),
      ),
    );
  }
}
