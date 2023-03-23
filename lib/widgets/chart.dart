import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/ChartBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionsValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekday), 'amount': totalSum};
    });
  }

  double get totalSpending {
    return groupTransactionsValues.fold(0.0, (sum, trx) {
      return sum += (trx['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransactionsValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransactionsValues
              .map((trx) => ChartBar(
                  trx['day'].toString(),
                  trx['amount'] as double,
                  totalSpending == 0.0
                      ? 0.0
                      : (trx['amount'] as double) / totalSpending))
              .toList()),
    );
  }
}
