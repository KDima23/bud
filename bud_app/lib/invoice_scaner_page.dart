
import 'package:flutter/material.dart';
//import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';
import 'bottom_nav_bar_home.dart';
import 'package:firebase_admob/firebase_admob.dart';


class InvoiceScanerPage extends StatefulWidget {
  static String tag = 'invoice-scaner-page';

  @override
  _InvoiceScanerPageState createState() => _InvoiceScanerPageState();
}

class _InvoiceScanerPageState extends State<InvoiceScanerPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8726446236198606~2135906039").then((response){
      myBanner..load()..show();
    });
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

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',

  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);