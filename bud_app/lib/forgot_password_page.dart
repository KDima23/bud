import 'package:flutter/material.dart';
import 'package:bud_app/login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  static String tag = 'forgot-password-page';

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
              width: 260.0,
              child: Text(
                'Please, enter your email address. You will receive a link to create a new password via email. ',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
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
            SizedBox(
              height: 50,
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
                    Navigator.of(context).pushNamed(LoginPage.tag);
                  },
                  textColor: Colors.white,
                  child: Text(
                    'Send',
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
