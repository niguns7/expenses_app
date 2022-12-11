import 'package:flutter/material.dart';

class Newtransaction extends StatefulWidget {
  final Function addTx;

  Newtransaction(this.addTx);

  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final titleController = TextEditingController();

  final AmountController = TextEditingController();

  void submitData() {
    final enteredData = titleController.text;
    final enteredAmount = double.parse(AmountController.text);

    if (enteredData.isEmpty || enteredAmount <= 0) {
      return; //return also stops the function execution
    }
    widget.addTx(
      enteredData,
      enteredAmount,


    );
          Navigator.of(context).pop(); //pop down for bottom box .... context is auto defined by class
          //submitting the transactiion when button is presed
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter title'),
              controller: titleController,
              onSubmitted: ((value) =>
                  submitData), //type of value on submitdata is string
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter amount'),
              controller: AmountController,
              onSubmitted: ((value) => submitData()),
              //onChanged: ((value) => AmountInupt=value),
            ),
            TextButton(
              onPressed: submitData,
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple, // Text Color
              ),
              child: const Text(
                'Add Transaction ',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
