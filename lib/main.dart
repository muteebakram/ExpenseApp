import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ExpenseApp",
      home: UserTransaction(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.greenAccent,
        fontFamily: "Quiksand",
      ),
    );
  }
}
