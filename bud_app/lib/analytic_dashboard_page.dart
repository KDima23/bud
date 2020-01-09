import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:bud_app/app_bar.dart';
import 'package:bud_app/bottom_nav_bar_home.dart';
//import 'package:bud_app/label_pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';



class AnalyticDashboardPage extends StatefulWidget {
  static String tag = 'analytic-dashboard-page';

  @override
  _AnalyticDashboardPageState createState() => _AnalyticDashboardPageState();
}

class _AnalyticDashboardPageState extends State<AnalyticDashboardPage> {
  List<charts.Series<Record, String>> _seriesPieData;
  List<Record> mydata;
  _generateData(mydata) {
    _seriesPieData = List<charts.Series<Record, String>>();
    _seriesPieData.add(
      charts.Series(
        domainFn: (Record record, _) => record.transaction_type,
        measureFn: (Record record, _) => record.withdrawal_amt,
        colorFn: (Record record, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(record.color))),
        id: 'Transactions',
        data: mydata,
        labelAccessorFn: (Record row, _) => "${row.transaction_type}",

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: AppBarH(),
            pinned: true,
            expandedHeight: 350.0,
            backgroundColor: Colors.grey[200],
            iconTheme: IconThemeData(color: Colors.blue),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildBody(context),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(
            height: 1000,
            child: Center(
              child: _buildBody2(context),
            ),
          ),),
        ],
      ),

      bottomNavigationBar: Container(
        child: BottomNavigationBarHome(),
        color: Colors.transparent,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Transactions').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Record> record = snapshot.data.documents
              .map((documentSnapshot) => Record.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, record);// _buildChart(context, record);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Record> data) {
    mydata = data;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 5),
//                    behaviors: [
//                      new charts.DatumLegend(
//                        outsideJustification:
//                        charts.OutsideJustification.endDrawArea,
//                        horizontalFirst: false,
//                        desiredMaxRows: 3,
//                        cellPadding:
//                        new EdgeInsets.only(right: 4.0, bottom: 4.0,top:4.0),
//                        entryTextStyle: charts.TextStyleSpec(
//                            color: charts.MaterialPalette.purple.shadeDefault,
//                            fontSize: 18),
//                      ),
//                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 110,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(insideLabelStyleSpec: new charts.TextStyleSpec(fontSize: 16,
                              color: charts.Color.white),
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody2(BuildContext context) {
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

//    const color = const Color(0x14794471);

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
///// This is used to show that legend symbols can be assigned a custom symbol.
//class IconRenderer extends charts.SymbolRenderer {
//  final IconData iconData;
//  IconRenderer(this.iconData);
//
//  @override
//  Widget build(BuildContext context,
//      {Size size, Color color, bool isSelected}) {
//    return new SizedBox.fromSize(
//        size: size, child: new Icon(iconData, color: color, size: 12.0));
//  }
//}
