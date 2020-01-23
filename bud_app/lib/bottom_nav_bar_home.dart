import 'package:flutter/material.dart';
import 'package:bud_app/analytic_dashboard_page.dart';
import 'package:bud_app/home_page.dart';
import 'package:bud_app/invoice_scaner_page.dart';
import 'package:bud_app/settings_page.dart';
import 'package:firebase_admob/firebase_admob.dart';


class BottomNavigationBarHome extends StatelessWidget {
  const BottomNavigationBarHome();

  @override
  Widget build(BuildContext context) {
//    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8726446236198606~2135906039").then((response){
//      myBanner..load()..show();
//    });
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