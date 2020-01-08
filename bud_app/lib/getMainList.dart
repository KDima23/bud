import 'transactionCard.dart';
import 'package:firebase_database/firebase_database.dart';   //import the package
import 'dart:async' show Future;


//class MakeCall{
//  List<TransactionDetailListItem> listItems=[];
//// ListItem recipeModelList=new ListItem();
//
//
//  Future<List<TransactionDetailListItem>> firebaseCalls(DatabaseReference databaseReference) async{
//    TransactionList transactionList;
//      print('makebody');
//      DataSnapshot dataSnapshot = await databaseReference.once();
//      print('makebody2');
//      Map<dynamic,dynamic> jsonResponse=dataSnapshot.value[0]['transactions'];
//      transactionList = new TransactionList.fromJSON(jsonResponse);
////      print('dada $transactionList');
//      listItems.addAll(transactionList.transactionList);
//      print(dataSnapshot.value);
//      print('List ${listItems[1].transactions}');
//    return listItems;
//  }
//}

