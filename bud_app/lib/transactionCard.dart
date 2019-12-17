import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';   //import the package
/// example JSON data format
//{
  //"id": "JS",
  //"account_No": "409000362497",
  //"date": "2015-07-16",
  //"WITHDRAWAL_AMT": "250",
  //"DEPOSIT_AMT": "2015",
  //"BALANCE_AMT": "250000"
//}

//Class contain the necessary attributes for the transactions.
// This class is used to define the contents of each ListItem.

class TransactionList{
  List<TransactionDetailListItem> transactionList;

  TransactionList({this.transactionList});

  factory TransactionList.fromJSON(Map<dynamic,dynamic> json){
    return TransactionList(
        transactionList: parsetransactions(json)
    );
  }

  static List<TransactionDetailListItem> parsetransactions(transactionJSON){
    var tList=transactionJSON['transactions'] as List;
    List<TransactionDetailListItem> transactionList=tList.map((data) => TransactionDetailListItem.fromJson(data)).toList();
    return transactionList;

  }
}


final databaseReference = FirebaseDatabase.instance.reference();


class TransactionDetailListItem {
  final String id;
  final String accountNum;
  final String date;
  final String withdraw_amt;
  final String deposit_amt;
  final String balance_amt;

// Declare a constructor for the same.
  TransactionDetailListItem({this.id, this.accountNum, this.date, this.withdraw_amt, this.deposit_amt, this.balance_amt });

  factory TransactionDetailListItem.fromJson(Map<dynamic,dynamic> parsedJson) {
//    print(parsedJson);
    return TransactionDetailListItem(accountNum:parsedJson['account_No'],date: parsedJson['date'],withdraw_amt:parsedJson['withdraw_amt'],deposit_amt: parsedJson['deposit_amt'],balance_amt:parsedJson['balance_amt']);
  }
}





