import 'package:flutter/material.dart';
import '../modal/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);
 
  List <Map<String, Object>> get getGroupedTransactiion {
    return List.generate(7, (index) { 
        final Weekday = DateTime.now().subtract(Duration(days: index),);
        var totalSum=0.0;

        for(var i=0;i<recentTransaction.length;i++){
          if (recentTransaction[i].date.day == Weekday.day &&
              recentTransaction[i].date.month == Weekday.month && 
              recentTransaction[i].date.year == Weekday.year) {
            totalSum += recentTransaction[i].amount;
          }
        }
        return {'day' : DateFormat.E(Weekday), 'amount': totalSum};
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(children: <Widget>[],),
    );
  }
}