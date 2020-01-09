import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:bud_app/app_bar.dart';
import 'package:bud_app/bottom_nav_bar_home.dart';
import 'package:bud_app/label_pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;


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
            charts.ColorUtil.fromDartColor(Colors.green),
        id: 'tasks',
        data: mydata,
        labelAccessorFn: (Record row, _) => "${row.transaction_type}",
      ),
    );
  }

//  HomePage homePage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: AppBarH(),
            pinned: true,
            expandedHeight: 210.0,
            backgroundColor: Colors.grey[200],
            iconTheme: IconThemeData(color: Colors.blue),
            flexibleSpace: FlexibleSpaceBar(
              background: DonutPieChart(_createSampleData(),true),
            ),
          ),
//          SliverList(
//            delegate: SliverChildListDelegate(
//              <Widget>[
//                transactionCard(
//                    "assets/images/home_24px.png", "Utilities", "6", "23"),
//                transactionCard("assets/images/extension_24px.png",
//                    "Entertainment", "6", "23"),
//                transactionCard("assets/images/favorite_border_24px.png",
//                    "Health", "6", "23"),
//                transactionCard("assets/images/restaurant_24px.png",
//                    "Restaurants", "6", "23"),
//                transactionCard("assets/images/shopping_basket_24px.png",
//                    "Shopping", "6", "23"),
//                transactionCard("assets/images/account_balance_wallet_24px.png",
//                    "Cash", "6", "23"),
//                transactionCard(
//                    "assets/images/bus_24px.png", "Transport", "6", "23"),
//                transactionCard("assets/images/publicon_social_24px.png",
//                    "Travel", "6", "23"),
//                transactionCard("assets/images/swap_horiz_24px.png",
//                    "Transfers", "6", "23"),
//                transactionCard("assets/images/local_grocery_store_24px.png",
//                    "Groceries", "6", "23"),
//              ],
//            ),
//          ),
        ],
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBarHome(),
        color: Colors.transparent,
      ),
    );
  }


}

/// Create one series with sample hard coded data.
List<charts.Series<TransactionTypes, int>> _createSampleData() {
  Record record;
  final data = [
    new TransactionTypes(0, 100),
    new TransactionTypes(1, 75),
    new TransactionTypes(2, 25),
    new TransactionTypes(3, 5),
  ];

  return [
    new charts.Series<TransactionTypes, int>(
      id: 'Sales',
      domainFn: (TransactionTypes sales, _) => sales.transaction,
      measureFn: (TransactionTypes sales, _) => sales.amount,
      data: data,
// Set a label accessor to control the text of the arc label.
      labelAccessorFn: (TransactionTypes row, _) => '${row.transaction}: ${row.amount}',
    )
  ];
}

/// Sample linear data type.
class TransactionTypes {
  final int transaction;
  final int amount;

  TransactionTypes(this.transaction, this.amount);
}