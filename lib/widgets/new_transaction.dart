import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final AmountController = TextEditingController();
 
  Newtransaction(this.addTx);

  void submitData() {
    final enteredData = titleController.text;
    final enteredAmount = double.parse(AmountController.text);

    if (enteredData.isEmpty || enteredAmount <= 0) {
      return; //return also stops the function execution
    }
    addTx(
      enteredData,
      enteredAmount,
    ); //submitting the transactiion when button is presed
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
