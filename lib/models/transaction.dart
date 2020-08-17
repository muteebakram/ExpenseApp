import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime dateadded;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.dateadded,
  });
}
