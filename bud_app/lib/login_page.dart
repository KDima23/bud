import 'package:flutter/material.dart';
#import 'package:flutter_app/forgot_password_page.dart';
#import 'package:flutter_app/home_page.dart';
#import 'package:flutter_app/signup_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ForgotPasswordPage.tag);
                  },
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
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SignUpPage.tag);
                },
                child: Text(
                  "Sign up?",
                  style: TextStyle(color: Colors.blue),
                )),
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
                    'Log In',
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
