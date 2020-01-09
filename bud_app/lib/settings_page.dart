import 'package:bud_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:bud_app/auth.dart';
import 'bottom_nav_bar_home.dart';


class SettingsPage extends StatefulWidget {
  static String tag = 'settings-page';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AuthService _auth = AuthService();

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
            Container(
              child: Ink(
                decoration: ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  color: Colors.grey[600],
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.of(context).pushNamed(LoginPage.tag);


                    print("filled background");
                  },
                ),
              ),
            ),
            Container(
              width: 320.0,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 12.0))),
            ),
            Container(
              width: 320.0,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 12.0))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
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
