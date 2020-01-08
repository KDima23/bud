import 'package:flutter/material.dart';

class FlexibleAppBarH extends StatelessWidget {
  final double barHeightF = 230.0;

  const FlexibleAppBarH();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeightF,
      color: Colors.grey[200],
      child: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
                child: Align(
                    child: Image.asset(
              'assets/budblue.png',
              height: 57,
              width: 98,
            ))),
            Container(
              child: new Text(
                "Accounts",
                style: const TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 30.0,
                child: ListView(
                  children: <Widget>[
                    accountsCard("123456789", "23000"),
                    accountsCard("Add bank account", ""),
                  ],
                ),
              ),
            ),
            Container(
              child: new Text(
                "Transactions",
                style: const TextStyle(color: Colors.black, fontSize: 18.0),
              ),

            )
          ],
        ),
      ),
    );
  }
}

Widget accountsCard(String bankAccount, String accountVal) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6.0),
    child: Material(
      color: Colors.white,
      shadowColor: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: accountsB(
          bankAccount,
          accountVal,
        ),
      ),
    ),
  );
}

Center accountsB(String bankAccount, String accountVal) {
  return Center(
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Text(
                bankAccount,
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ),
            Container(
              child: Text(
                "\u0024" + accountVal,
                style: TextStyle(color: Colors.blue, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
