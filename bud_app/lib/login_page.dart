import 'package:bud_app/auth.dart';
import 'package:flutter/material.dart';
import 'package:bud_app/forgot_password_page.dart';
import 'package:bud_app/home_page.dart';
import 'package:bud_app/signup_page.dart';
import 'package:bud_app/loading.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  final Function toggleView;
  LoginPage({ this.toggleView });


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';


  String email = '';
  String password = '';
  bool loading = false;

//  final AuthService _auth = AuthService();


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
            Container(child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 320.0,
                    child: TextFormField(validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {

                          setState(() => email = val.trim());
                    },
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0))),
                  ),
                  Container(
                    width: 320.0,
                    child: TextFormField(validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                        onChanged: (val) {
                          setState(() => password = val.trim());
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0))),
                  ),

                ],
              ),
            ),),

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
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      print("valid");
//                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      print(result);
                      if(result == null) {
                        setState(() {
                          loading = false;
                          error = 'Could not sign in with those credentials';
                        });
                      }
                    }

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

