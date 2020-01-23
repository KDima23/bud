
import 'package:flutter/material.dart';
import 'package:bud_app/remove_add_buttons.dart';
import 'package:bud_app/app_bar.dart';
import 'package:bud_app/analytic_dashboard_page.dart';

class ChangeLimitPage extends StatefulWidget {
  static String tag = 'change-limit-page';

  @override
  _ChangeLimitPageState createState() => _ChangeLimitPageState();
}

class _ChangeLimitPageState extends State<ChangeLimitPage> {
  final myController = TextEditingController();
//  final formKeyL = Keys();
  final formKeyL = GlobalKey<FormState>();


  final lim = Limits();
  var limitt = '';

  void _submition(val ){
    myController.clear();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: AppBarH(),
            pinned: true,
            backgroundColor: Colors.grey[200],
            iconTheme: IconThemeData(color: Colors.blue),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                transactionCard(
                    "assets/images/home_24px.png", "Utilities", Container(
                  width: 50.0,
                  child: TextFormField(controller: myController, validator: (val) => val.length < 1 ? 'Enter 1+ chars long' : null,
                      onChanged: (val) {
                        setState(() => lim.limitU = val.trim());
                        print('limit ');
                        print(lim.limitU);
                        limitt = lim.limitU;
//                        lim.limitU = myController.toString();

                      },
                      onFieldSubmitted: _submition,
                      decoration: InputDecoration(
                          hintText: "\u0024",
                          hintStyle:
                          TextStyle(color: Colors.grey[400], fontSize: 20.0))),
                ), limitt),
                transactionCard("assets/images/extension_24px.png",
                    "Entertainment", Container(
                      width: 50.0,
                      child: TextFormField(validator: (val) => val.length < 1 ? 'Enter 1+ chars long' : null,
                          onChanged: (val) {
                            setState(() => lim.limitE = val.trim());
                          },
                          decoration: InputDecoration(
                              hintText: "\u0024",
                              hintStyle:
                              TextStyle(color: Colors.grey[400], fontSize: 20.0)),showCursor: false,),
                    ), lim.limitE),
//                transactionCard("assets/images/favorite_border_24px.png",
//                    "Health", "6", limitH),
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
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 40.0,right: 40.0, bottom: 20.0,top: 20.0),
              height: 42.0,
              width: 99.0,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.redAccent[400],
                      Colors.blue[400],
                    ],
                  )),
              child: RaisedButton(
                color: Colors.transparent,
                onPressed: ()  {
                  print("remove");
                },
                textColor: Colors.white,
                child: Text('Remove',textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Noto_Sans', fontSize: 16.0),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              )),
          Container(
              margin: EdgeInsets.only(left: 40.0,right: 40.0, bottom: 20.0,top: 20.0),
              height: 42.0,
              width: 99.0,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.greenAccent,
                      Colors.blue[400],
                    ],
                  )),
              child: RaisedButton(
                color: Colors.transparent,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AnalyticDashboardPage();
                  }));
//                  Navigator.of(context).pushNamed(AnalyticDashboardPage.tag);
                },
                textColor: Colors.white,
                child: Text('Add', textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Noto_Sans', fontSize: 16.0),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
              ))
        ],) ,color: Colors.transparent,) ,
    );
  }

  Widget transactionCard(String iconVal, String transactionType,
      Widget transactionCount, String transactionVal) {
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
      Widget transactionCount, String transactionVal) {
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
      String iconVal, String transactionType, Widget transactionCount) {
    return Container(
      child: Row(//mainAxisAlignment: MainAxisAlignment.end,
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
          Container(
            child: Text(
              transactionType,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ),
          SizedBox(
            width: 40.0,
          ),
          Container(child: Form(
            child: transactionCount

          ),),

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

}

class Limits {

  String limitU = '';
  String limitE = '';
  String limitH = '';
  String limit = '';

//  Limits({ this.limitU });
//  static final riKey1 = const Key('__RIKEY1__');
//  static final riKey2 = const Key('__RIKEY2__');
//  static final riKey3 = const Key('__RIKEY3__');
}

//class Keys <key> {
//  final formKeyL = GlobalKey<FormState>();
//
//
//}
