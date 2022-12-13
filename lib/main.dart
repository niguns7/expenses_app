import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transiction_list.dart';
import './widgets/new_transaction.dart';
import './modal/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
          primarySwatch: Colors.purple, //sets defult color
          fontFamily: 'QuickSand',
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold, 
              fontSize: 18),
              button: TextStyle(color: Colors.white)
          ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20 ,
                    fontWeight: FontWeight.bold),),),),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //String AmountInupt;
  final List<Transaction> _userTransactions = [
    //Transaction(
    //  id: 't1',
    //  title: 'New Shoes',
    //  amount: 69.99,
    //  date: DateTime.now(),
    //),
    //Transaction(
    //  id: 't2',
    //  title: 'Groceries',
    //  amount: 79.59,
    //  date: DateTime.now(),
    //),
  ];

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount, DateTime choosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: choosenDate,
        );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _StartNewtransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: (() {}),
          child: Newtransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deletTransaction (String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses App',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _StartNewtransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(_userTransactions, _deletTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _StartNewtransaction(context),
      ),
    );
  }
}
