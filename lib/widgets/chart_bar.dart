import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarChart extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double percentage;

  BarChart({
    @required this.label,
    @required this.amountSpent,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(2),
          height: 20,
          child: FittedBox(
            child: Text(
              "₹${NumberFormat("#,##0", "en_US").format(amountSpent)}",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 80,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black26),
                ),
              ),
              FractionallySizedBox(
                heightFactor: 1 - percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(200, 200, 200, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black26),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(2),
          child: FittedBox(
            child: Text(
              "$label",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
