//import 'dart:convert';
////import 'package:firebase_database/firebase_database.dart';   //import the package
///// example JSON data format
////{
//  //"id": "JS",
//  //"account_No": "409000362497",
//  //"date": "2015-07-16",
//  //"WITHDRAWAL_AMT": "250",
//  //"DEPOSIT_AMT": "2015",
//  //"BALANCE_AMT": "250000"
////}
//
////Class contain the necessary attributes for the transactions.
//// This class is used to define the contents of each ListItem.
//
////class TransactionList{
////  List<TransactionDetailListItem> transactionList;
////
////  TransactionList({this.transactionList});
////
////  factory TransactionList.fromJSON(Map<dynamic,dynamic> json){
////    return TransactionList(
////        transactionList: parsetransactions(json)
////    );
////  }
////
////  static List<TransactionDetailListItem> parsetransactions(transactionJSON){
////    var tList=transactionJSON['transactions'] as List;
////    List<TransactionDetailListItem> transactionList=tList.map((data) => TransactionDetailListItem.fromJson(data)).toList();
////    print("transactionList");
////    print(transactionList);
////    return transactionList;
////
////  }
////}
//
//
////final databaseReference = FirebaseDatabase.instance.reference();
//
//
//class TransactionDetailListItem {
//  String _id, _accountNum, _date, _withdraw_amt, _deposit_amt, _balance_amt;
//
//// Declare a constructor for the same.
//  TransactionDetailListItem(this._id, this._accountNum, this._date, this._withdraw_amt, this._deposit_amt, this._balance_amt );
//
//  TransactionDetailListItem.map(dynamic obj) {
//    this._id = obj['id'];
//    this._accountNum = obj['accountNum'];
//    this._date = obj['date'];
//    this._withdraw_amt = obj['withdraw_amt'];
//    this._deposit_amt = obj['deposit_amt'];
//    this._balance_amt = obj['balance_amt'];
//  }
//
//  String get id => _id;
//  String get accountNum => _accountNum;
//  String get date => _date;
//  String get withdraw_amt => _withdraw_amt;
//  String get deposit_amt => _deposit_amt;
//  String get balance_amt => _balance_amt;
//
//
//  TransactionDetailListItem.fromSnapshot(DataSnapshot snapshot) {
//    _id = snapshot.key;
//    _accountNum = snapshot.value['accountNum'];
//    _date = snapshot.value['date'];
//    _withdraw_amt = snapshot.value['withdraw_amt'];
//    _deposit_amt = snapshot.value['deposit_amt'];
//    _balance_amt = snapshot.value['balance_amt'];
//  }
////  factory TransactionDetailListItem.fromJson(Map<dynamic,dynamic> parsedJson) {
////    print("jsonka");
////    print(parsedJson);
////    return TransactionDetailListItem(accountNum:parsedJson['account_No'],date: parsedJson['date'],withdraw_amt:parsedJson['withdraw_amt'],deposit_amt: parsedJson['deposit_amt'],balance_amt:parsedJson['balance_amt']);
////  }
//}
//
//
//
//
//
