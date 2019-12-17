import 'package:flutter/material.dart';
import 'package:bud_app/app_bar.dart';
import 'package:bud_app/flexible_app_bar.dart';

//import 'bottom_nav_bar_home.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: AppBarH(),
            pinned: true,
            expandedHeight: 210.0,
            backgroundColor: Colors.grey[200],
            iconTheme: IconThemeData(color: Colors.blue),
            flexibleSpace: FlexibleSpaceBar(
              background: FlexibleAppBarH(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                transactionCard(
                    "assets/images/home_24px.png", "Utilities", "6", "23"),
                transactionCard("assets/images/extension_24px.png",
                    "Entertainment", "6", "23"),
                transactionCard("assets/images/favorite_border_24px.png",
                    "Health", "6", "23"),
                transactionCard("assets/images/restaurant_24px.png",
                    "Restaurants", "6", "23"),
                transactionCard("assets/images/shopping_basket_24px.png",
                    "Shopping", "6", "23"),
                transactionCard("assets/images/account_balance_wallet_24px.png",
                    "Cash", "6", "23"),
                transactionCard(
                    "assets/images/bus_24px.png", "Transport", "6", "23"),
                transactionCard("assets/images/publicon_social_24px.png",
                    "Travel", "6", "23"),
                transactionCard("assets/images/swap_horiz_24px.png",
                    "Transfers", "6", "23"),
                transactionCard("assets/images/local_grocery_store_24px.png",
                    "Groceries", "6", "23"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(child: BottomNavigationBarHome(),color: Colors.transparent,) ,
    );
  }
}

Widget transactionCard(String iconVal, String transactionType,
    String transactionCount, String transactionVal) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6.0),
    child: Material(
      color: Colors.white,
      shadowColor: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: transActions(
          iconVal,
          transactionType,
          transactionCount,
          transactionVal,
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
