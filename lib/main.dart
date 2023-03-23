import 'package:expenses_app/widgets/chart.dart';
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
  final List<Transaction> _transactions = [
    // Transaction(
    //     id: 't1', title: 'new Shose', amount: 69.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now()),
    // Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((trx) {
      return trx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txtitle, double txamount) {
    setState(() {
      _transactions.add(Transaction(
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
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 40,
                      fontWeight: FontWeight.bold)))),
      home: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Expenses App',
              style: Theme.of(context).textTheme.titleMedium,
            ),
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
                  Chart(_recentTransactions),
                  TransactionList(_transactions),
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
