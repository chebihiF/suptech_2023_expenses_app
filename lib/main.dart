import './Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyHomepage());
}

class MyHomepage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new Shose', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now())
  ];

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              Card(
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'Title'),
                            controller: titleController,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Amount'),
                            controller: amountController,
                          ),
                          TextButton(
                            onPressed: () {
                              transactions.add(Transaction(
                                  id: DateTime.now().toString(),
                                  title: titleController.text,
                                  amount: double.parse(amountController.text),
                                  date: DateTime.now()));
                            },
                            child: Text('Add Transaction'),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.purple)),
                          )
                        ])),
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
                                  '\$${tx.amount}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.purple),
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat.yMMMd().format(tx.date),
                                  style: TextStyle(color: Colors.grey),
                                )
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
