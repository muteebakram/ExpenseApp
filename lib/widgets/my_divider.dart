import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final String textName;

  MyDivider({@required this.textName});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
      child: Text(
        textName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }
}
