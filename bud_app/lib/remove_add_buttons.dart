import 'package:flutter/material.dart';
import 'package:bud_app/analytic_dashboard_page.dart';
import 'package:bud_app/home_page.dart';
import 'package:bud_app/invoice_scaner_page.dart';
import 'package:bud_app/settings_page.dart';
import 'package:bud_app/change_limit.dart';


class RemoveAddButtons extends StatelessWidget {

  const RemoveAddButtons();





  @override
  Widget build(BuildContext context) {

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                Navigator.of(context).pushNamed(AnalyticDashboardPage.tag);
              },
              textColor: Colors.white,
              child: Text('Add', textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Noto_Sans', fontSize: 16.0),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
            ))
      ],);

  }
}
