import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new Shose', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't2', title: 'Gaz', amount: 30.99, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions
          .map((tx) => Card(
                  child: Row(
                children: [
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
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
                            fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}
