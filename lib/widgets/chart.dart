import 'package:flutter/material.dart';
import '../modal/transaction.dart';
import './chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactiionValues {
    return List.generate(7, (index) {
      final Weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == Weekday.day &&
            recentTransaction[i].date.month == Weekday.month &&
            recentTransaction[i].date.year == Weekday.year) {
          totalSum += recentTransaction[i].amount;
        }
        print(DateFormat.E().format(Weekday));
        print(totalSum);
      }
      return {
        'day': DateFormat.E().format(Weekday).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactiionValues.fold(0.0, (sum, items) {
      return sum + items['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(25),
      child: Row(
        children: groupedTransactiionValues.map((data) {
          return ChartBar(data['day'], data['amount'],
              totalSpending == 0.0 ? 0.0 :(data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
