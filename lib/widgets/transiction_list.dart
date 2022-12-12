import 'package:flutter/material.dart';
import '../modal/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      child: transaction.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  height: 520,
                  width: 600,
                    child: Image.asset(
                  'assets/images/image.png',
                  fit: BoxFit.cover,
                ))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        child: Text(
                          '\$${transaction[index].amount.toStringAsFixed(2)}', //string interpolation
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transaction[index].date),
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
