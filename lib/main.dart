import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyHomepage());
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new Shose', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now())
  ];
  void _addTransaction(String txtitle, double txamount) {
    setState(() {
      transactions.add(Transaction(
          id: DateTime.now().toString(),
          title: txtitle,
          amount: txamount,
          date: DateTime.now()));
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Expenses App'),
            actions: [
              IconButton(
                  onPressed: () => _startAddNewTransaction(context),
                  icon: Icon(Icons.add))
            ],
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
                  TransactionList(transactions),
                ]),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () => _startAddNewTransaction(context),
            child: Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
