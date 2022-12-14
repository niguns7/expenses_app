import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double SpendingAmount;
  final double SpendingPofTotal;

  ChartBar(this.lable, this.SpendingAmount, this.SpendingPofTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, Constraints) {
      return  Column(
      children: <Widget>[
        Container(
          height: Constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Text('\$${SpendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: Constraints.maxHeight * 0.05,
        ),
        Container(
          height: Constraints.maxHeight * 0.6 ,
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ]),
        ),
        SizedBox(
          height: Constraints.maxHeight * 0.05,
        ),
        Container(
          height: Constraints.maxHeight * 0.15,
          child: Text(lable),),
      ],
    );
    },); 
  }
}
