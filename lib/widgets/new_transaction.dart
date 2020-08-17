import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction({@required this.addTx});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Expense\n",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          TextField(
            controller: _titleController,
            cursorColor: Theme.of(context).primaryColorDark,
            decoration: InputDecoration(
              labelText: "Title",
              fillColor: Theme.of(context).primaryColorDark,
              focusColor: Theme.of(context).primaryColorDark,
              hoverColor: Theme.of(context).primaryColorDark,
            ),
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _amountController,
            cursorColor: Theme.of(context).primaryColorDark,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Amount",
              fillColor: Theme.of(context).primaryColorDark,
              focusColor: Theme.of(context).primaryColorDark,
              hoverColor: Theme.of(context).primaryColorDark,
            ),
            onSubmitted: (_) => _submitData(),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? "No date chosen!"
                        : "Date: ${DateFormat.yMMMd().format(_selectedDate)}",
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  color: Theme.of(context).primaryColorDark,
                  onPressed: _presentDatePicker,
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: RaisedButton(
              child: Text("Add Expense",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  )),
              color: Theme.of(context).primaryColorDark,
              onPressed: () => _submitData,
            ),
          )
        ],
      ),
    );
  }
}
