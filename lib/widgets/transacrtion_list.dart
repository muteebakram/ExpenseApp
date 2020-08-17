import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList({@required this.transaction, @required this.deleteTx});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        reverse: true,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 10,
            ),
            shadowColor: Theme.of(context).primaryColor,
            child: ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundColor: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: FittedBox(
                    child: Text(
                      "₹${NumberFormat("#,##0", "en_US").format(transaction[index].amount)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              title: Text(
                "${transaction[index].title}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                  DateFormat("MMM dd, y").format(transaction[index].dateadded)),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                onPressed: () => deleteTx(transaction[index].id),
              ),
            ),
          );
          // return TransactionCard(
          //   index: index,
          //   transaction: transaction,
          // );
        },
        itemCount: transaction.length,
      ),
    );
  }
}

// class TransactionCard extends StatelessWidget {
//   TransactionCard({
//     Key key,
//     @required this.transaction,
//     @required this.index,
//   }) : super(key: key);

//   var index = 0;
//   final List<Transaction> transaction;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       shadowColor: Theme.of(context).primaryColorLight,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
//                 child: Text(
//                   "${transaction[index].title}",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(5),
//                 child: Text(
//                   DateFormat("MMM dd, y | H:m")
//                       .format(transaction[index].dateadded),
//                   style: TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.all(10),
//             padding: EdgeInsets.all(10),
//             alignment: Alignment.topRight,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Theme.of(context).primaryColor,
//                 width: 2,
//               ),
//             ),
//             child: Text(
//               "₹ ${transaction[index].amount.toStringAsFixed(0)}",
//               textAlign: TextAlign.left,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).primaryColorDark,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
