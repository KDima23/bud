import 'package:flutter/material.dart';
import 'package:bud_app/home_page.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpPage extends StatefulWidget {
  static String tag = 'signup-page';
  final Function toggleView;
  SignUpPage({ this.toggleView });


  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;

//  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String email = '';
  String password = '';
  String phone = '';

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
                  child: TextFormField(validator: (val) => val.isEmpty ? 'Enter an email' : null, onChanged: (val){
                    setState(() => email = val.trim());

                  },
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle:
                          TextStyle(color: Colors.grey, fontSize: 12.0))),
                ),
                  Container(
                    width: 320.0,
                    child: TextFormField(obscureText: true, validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,

                        onChanged: (val){
                      setState(() => password = val.trim());
                    },
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0))),
                  ),
                  Container(
                    width: 320.0,
                    child: TextField(onChanged: (val){
                      setState(() => phone = val.trim());


                    },
                        decoration: InputDecoration(
                            hintText: "Mobile number (optional)",
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0))),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),

            ),),


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
                  onPressed: () async {
                    print("email $email");
                    print(email);
                    if(_formKey.currentState.validate()){
                      print("formkey");
                      print(_formKey.currentState.validate());
                      print(password);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
//                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
//                      Navigator.of(context).pushNamed(HomePage.tag);
                      if(result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                        });
                      }
                    }

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
        )

    );
  }
}

void logIn() {
  //Do something
}
