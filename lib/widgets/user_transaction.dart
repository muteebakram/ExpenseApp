import 'package:flutter/material.dart';

import './chart.dart';
import './my_divider.dart';
import './new_transaction.dart';
import './transacrtion_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: "t1",
    //   title: "New Phone",
    //   amount: 30000,
    //   dateadded: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t2",
    //   title: "Lunch",
    //   amount: 150,
    //   dateadded: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.dateadded.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      dateadded: chosenDate,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addTx: _addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpenseApp"),
        elevation: 10,
        backgroundColor: Theme.of(context).primaryColor,
        shadowColor: Theme.of(context).primaryColor,
      ),
      body: _userTransaction.isEmpty
          ? NoTransactions()
          : SingleChildScrollView(
              child: Column(
                children: [
                  MyDivider(textName: "My Weekly Spendings"),
                  Chart(recentTransaction: _recentTransaction),
                  MyDivider(textName: "My Expenditures"),
                  TransactionList(
                    transaction: _userTransaction,
                    deleteTx: _deleteTransaction,
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          return _startNewTransaction(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class NoTransactions extends StatelessWidget {
  const NoTransactions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              "Click plus button to add new expense.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                // color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            child: Image.asset(
              "assests/image/waiting.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
