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
      stream: Firestore.instance.collection('baby').snapshots(),
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

  Widget transactionCard(BuildContext context, DocumentSnapshot data) {


    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Material(
        color: Colors.white,
        shadowColor: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: transActions(
            record.name,
            record.name,
            record.name,
            record.name,
          ),
        ),
      ),
    );
  }

  Center transActions(String iconVal, String transactionType,
      String transactionCount, String transactionVal) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              leadingDetails(iconVal, transactionType, transactionCount),
              transactionValue(transactionVal),
            ],
          )
        ],
      ),
    );
  }

  Widget leadingDetails(
      String iconVal, String transactionType, String transactionCount) {
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
                  transactionType,
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Container(
                child: Text(
                  transactionCount + " TXN",
                  style: TextStyle(color: Colors.grey[400], fontSize: 12.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget transactionValue(String transactionVal) {
    return Container(
      child: Text(
        "\u0024" + transactionVal,
        style: TextStyle(color: Colors.blue, fontSize: 20.0),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Material(
        color: Colors.white,
        shadowColor: Colors.grey[200],
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: transActions(
            "assets/images/home_24px.png",
            record.name,
            record.votes.toString(),
            record.date.toString(),
          ),
        ),
      ),
    );
  }

}

class Record {
  final String name;
  final int votes;
  final int account_No;
  final int date;

  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        assert(map['account_No'] != null),
        assert(map['date'] != null),
        name = map['name'],
        votes = map['votes'],
        account_No = map['account_No'],
        date = map['date'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";
}


