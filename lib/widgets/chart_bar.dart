import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double SpendingAmount;
  final double SpendingPofTotal;

  ChartBar(this.lable,this.SpendingAmount,this.SpendingPofTotal);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('\$${SpendingAmount.toStringAsFixed(2)}'),
      SizedBox(height: 9,),
      Container(
        height: 90,
        width: 10,
        child: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              color: Color.fromRGBO(220, 220, 220, 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          FractionallySizedBox(
            heightFactor: SpendingPofTotal,
            child: 
            Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(10),
                ),),
          )
        ]),
      ),
      SizedBox(height: 10,),

    ],);
  }
}

