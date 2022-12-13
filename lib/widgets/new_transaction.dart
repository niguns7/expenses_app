import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Newtransaction extends StatefulWidget {
  final Function addTx;

  Newtransaction(this.addTx);

  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final _titleController = TextEditingController();
  final _AmountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredData = _titleController.text;
    final enteredAmount = double.parse(_AmountController.text);

    if (enteredData.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return; //return also stops the function execution
    }
    widget.addTx(
      enteredData,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context)
        .pop(); //pop down for bottom box .... context is auto defined by class
    //submitting the transactiion when button is presed
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) => {
              if (pickedDate == null) {},
              setState(
                () {
                  _selectedDate = pickedDate;
                },
              )
            });
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
              controller: _titleController,
              onSubmitted: ((value) =>
                  _submitData), //type of value on submitdata is string
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter amount'),
              controller: _AmountController,
              onSubmitted: ((value) => _submitData()),
              //onChanged: ((value) => AmountInupt=value),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No date choosen'
                        : 'Picked Date : ${DateFormat.yMd().format(_selectedDate)}' ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'Choose date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              style: TextButton.styleFrom(
                foregroundColor:
                    Theme.of(context).textTheme.button.color, // Text Color
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
