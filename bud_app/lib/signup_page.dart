import 'package:flutter/material.dart';
import 'package:bud_app/home_page.dart';

class SignUpPage extends StatefulWidget {
  static String tag = 'signup-page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            Center(child: Align(child: Image.asset('assets/budblue.png'))),
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
            Container(
              width: 320.0,
              child: TextField(
                  decoration: InputDecoration(
                      hintText: "Mobile number (optional)",
                      hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 12.0))),
            ),
            SizedBox(
              height: 70,
            ),
            Column(
              children: <Widget>[
                Text('By clicking Register, you agree to our',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey)),
                FlatButton(
                    onPressed: null,
                    child: Text(
                      "Terms and Privacy Statement.",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            Container(
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
                child: RaisedButton(
                  color: Colors.transparent,
                  onPressed: () {
                    Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  textColor: Colors.white,
                  child: Text(
                    'Register',
                    style: TextStyle(fontFamily: 'Noto_Sans', fontSize: 18.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                )),
            SizedBox(
              height: 5,
            )
          ],
        ));
  }
}

void logIn() {
  //Do something
}
