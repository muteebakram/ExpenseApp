import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart({@required this.recentTransaction});

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].dateadded.day == weekDay.day &&
            recentTransaction[i].dateadded.month == weekDay.month &&
            recentTransaction[i].dateadded.year == weekDay.year)
          totalSum += recentTransaction[i].amount;
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        "day": DateFormat.E().format(weekDay),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpendingforWeek {
    return groupedTransactionValues.fold(0.0, (weekSum, eachDay) {
      return weekSum + eachDay["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      shadowColor: Theme.of(context).primaryColor,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: BarChart(
                label: data["day"],
                amountSpent: data["amount"],
                percentage: totalSpendingforWeek == 0.0
                    ? 0.0
                    : (data["amount"] as double) / totalSpendingforWeek,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
