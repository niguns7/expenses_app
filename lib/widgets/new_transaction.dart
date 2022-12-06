import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Newtransaction extends StatelessWidget {

  final titleController= TextEditingController();
  final AmountController= TextEditingController();
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
              onPressed: () {},
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
