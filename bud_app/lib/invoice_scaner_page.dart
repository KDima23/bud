
import 'package:flutter/material.dart';
//import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'bottom_nav_bar_home.dart';

class InvoiceScanerPage extends StatefulWidget {
  static String tag = 'invoice-scaner-page';

  @override
  _InvoiceScanerPageState createState() => _InvoiceScanerPageState();
}

class _InvoiceScanerPageState extends State<InvoiceScanerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Center(
              child: Align(
                  child: Image.asset(
                    'assets/budblue.png',
                    height: 57,
                    width: 98,
                  ))),
          Column(
            children: <Widget>[
              Text('Accounts',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15.0)),
              FlatButton(
                  onPressed: null,
                  child: Text(
                    "Terms and Privacy Statement.",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),

          SizedBox(
            height: 70,
          ),
        ],
      ),
      bottomNavigationBar: Container(child: BottomNavigationBarHome(),color: Colors.transparent,) ,
    );
  }
}
