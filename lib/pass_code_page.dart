import 'package:flutter/material.dart';
import 'package:testapp/first_page.dart';
import 'package:testapp/lock_screen.dart';

class PassCodeScreen extends StatefulWidget {
  PassCodeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PassCodeScreenState createState() => new _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  @override
  Widget build(BuildContext context) {
    var myCodes = [1, 2, 3, 4];
    return new Scaffold(
      body: LockScreen(
          title: "This is Screet",
          codeLength: myCodes.length,
          bgImage: "images/pass_code_bg.jpg",
          fingerFunction: () => print("dede"),
          backgroundColor: new Color(0xff202835),
          foregroundColor: Colors.white,
          codeVerify: (List<int> codes) async {
            for (int i = 0; i < myCodes.length; i++) {
              if (codes[i] != myCodes[i]) {
                return false;
              }
            }
            return true;
          },
          onSuccess: () {
            Navigator.of(context).pushReplacement(
                new MaterialPageRoute(builder: (BuildContext context) {
              return FirstLoginPage();
            }));
          }),
    );
  }
}
