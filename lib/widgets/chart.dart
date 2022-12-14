import 'package:flutter/material.dart';
import '../modal/transaction.dart';
import './chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactiionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactiionValues.fold(0.0, (sum, items) {
      return sum + items['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(22),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactiionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
