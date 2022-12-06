
import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {
  final Function addTx;
  final titleController= TextEditingController();
  final AmountController= TextEditingController();

  Newtransaction(this.addTx);

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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter amount'),
              controller: AmountController,
              //onChanged: ((value) => AmountInupt=value),
            ),
            TextButton(
              onPressed: () {
                addTx(titleController.text, double.parse(AmountController.text) );
              },
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
