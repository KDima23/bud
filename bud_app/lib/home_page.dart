import 'package:flutter/material.dart';
import 'app_bar.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'flexible_app_bar.dart';

import 'bottom_nav_bar_home.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
//    final record = Record.fromSnapshot(data);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(preferredSize: Size.fromHeight(230.0),
        child: FlexibleAppBarH(),),
      extendBodyBehindAppBar: false,

      body: _buildBody(context),
//      CustomScrollView(
//        slivers: <Widget>[
//          SliverAppBar(
//            title: AppBarH(),
//            pinned: true,
//            expandedHeight: 210.0,
//            backgroundColor: Colors.grey[200],
//            iconTheme: IconThemeData(color: Colors.blue),
//            flexibleSpace: FlexibleSpaceBar(
//              background: FlexibleAppBarH(),
//            ),
//          ),
//          SliverList(
//            delegate: SliverChildListDelegate([
//              Column(children: <Widget>[_buildBody(context)],),
//            ]
//            ),
//          ),
//        ],
//      ),

      bottomNavigationBar: Container(child: BottomNavigationBarHome(),color: Colors.transparent,) ,
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Transactions').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 10.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );

  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.transaction_details),
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Material(
        color: Colors.white,
        shadowColor: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: transActions(
            record.transaction_type,
            record.transaction_details,
            record.date.toString(),
            record.deposit_amt,
            record.withdrawal_amt,
          ),
        ),
      ),
    );
  }

  Center transActions(String iconVal, String transaction_details,
      String date, int deposit_amt, int withdrawal_amt ) {



    switch (iconVal) {
      case 'Utilities':
        iconVal = "assets/images/home_24px.png";
        break;
      case 'Entertainment':
        iconVal = "assets/images/extension_24px.png";
        break;
      case 'Health':
        iconVal = "assets/images/favorite_border_24px.png";
        break;
      case 'Restaurants':
        iconVal = "assets/images/restaurant_24px.png";
        break;

      case 'Shopping':
        iconVal = "assets/images/shopping_basket_24px.png";
        break;
      case 'Cash':
        iconVal = "assets/images/account_balance_wallet_24px.png";
        break;
      case 'Transport':
        iconVal = "assets/images/bus_24px.png";
        break;
      case 'Travel':
        iconVal = "assets/images/publicon_social_24px.png";
        break;
      case 'Transfers':
        iconVal = "assets/images/swap_horiz_24px.png";
        break;
      case 'Groceries':
        iconVal = "assets/images/local_grocery_store_24px.png";
        break;


      default:
        print("ppp");

    }

    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              leadingDetails(iconVal, transaction_details, date),
              transactionValue(deposit_amt, withdrawal_amt),
            ],
          )
        ],
      ),
    );
  }

  Widget leadingDetails(
      String iconVal, String transaction_details, String date) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage(iconVal),
              height: 50.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            children: <Widget>[
              Container(
                child: Text(
                  transaction_details,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Container(
                child: Text(
                  date,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget transactionValue(int deposit_amt, int withdrawal_amt) {
    String transactionVal;
    bool variable;
    if(withdrawal_amt == 0 && deposit_amt != 0){
      variable = true;

      transactionVal = deposit_amt.toString();


    }else{
      transactionVal= withdrawal_amt.toString();
      variable = false;
    }
    return Container(
      child: Text(
        "\u0024" + transactionVal,
        style: TextStyle(color: variable ? Colors.blue : Colors.red, fontSize: 20.0),
      ),
    );
  }



}

class Record {
  final int account_No;
  final String date;
  final int deposit_amt;
  final String transaction_details;
  final String transaction_type;
  final int withdrawal_amt;
  final String color;

  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['account_No'] != null),
        assert(map['date'] != null),
        assert(map['deposit_amt'] != null),
        assert(map['withdrawal_amt'] != null),
        assert(map['transaction_details'] != null),
        assert(map['transaction_type'] != null),
        assert(map['color'] != null),


      account_No = map['account_No'],
        date = map['date'],
        deposit_amt = map['deposit_amt'],
        withdrawal_amt = map['withdrawal_amt'],
        transaction_details = map['transaction_details'],
        transaction_type = map['transaction_type'],
        color = map['color'];


  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

//  @override
//  String toString() => "Record<$transaction_details:$transaction_type>";

}




