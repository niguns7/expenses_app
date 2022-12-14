import 'package:flutter/material.dart';
import '../modal/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
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
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle:Text(
                      DateFormat.yMMMd().format(transaction[index].date) ,
                    ) ,
                    trailing: IconButton(onPressed: () => deleteTx(transaction[index].id) , icon: Icon(Icons.delete), color: Color.fromARGB(255, 237, 195, 45),),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
