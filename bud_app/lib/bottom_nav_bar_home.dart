import 'package:flutter/material.dart';
import 'package:bud_app/analytic_dashboard_page.dart';
import 'package:bud_app/home_page.dart';
import 'package:bud_app/invoice_scaner_page.dart';
import 'package:bud_app/settings_page.dart';


class BottomNavigationBarHome extends StatelessWidget {
  const BottomNavigationBarHome();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40.0,right: 40.0, bottom: 6.0,top: 6.0),
      height: 42.0,
      width: 275.0,
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: <Color>[
              Colors.purpleAccent,
              Colors.blue[400],
            ],
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.business_center),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.of(context).pushNamed(HomePage.tag);
            },
          ),
          IconButton(
            icon: Icon(Icons.equalizer),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.of(context).pushNamed(AnalyticDashboardPage.tag);
            },
          ),
          IconButton(
            icon: Icon(Icons.add_a_photo),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.of(context).pushNamed(InvoiceScanerPage.tag);
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.grey[700],
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsPage.tag);
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
