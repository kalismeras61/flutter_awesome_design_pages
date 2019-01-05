import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/empty_page.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class PassCodeScreen extends StatefulWidget {
  PassCodeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PassCodeScreenState createState() => new _PassCodeScreenState();
}

class _PassCodeScreenState extends State<PassCodeScreen> {
  bool isFingerprint = false;

  Future<Null> biometrics() async {
    final LocalAuthentication auth = new LocalAuthentication();
    bool authenticated = false;

    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      setState(() {
        isFingerprint = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myPass = [1, 2, 3, 4];
    return LockScreen(
        title: "This is Screet",
        passLength: myPass.length,
        bgImage: "images/pass_code_bg.jpg",
        fingerPrintImage: "images/fingerprint.png",
        showFingerPass: true,
        fingerFunction: biometrics,
        fingerVerify: isFingerprint,
        numColor: Colors.blue,
        borderColor: Colors.white,
        showWrongPassDialog: true,
        wrongPassContent: "Wrong pass please try again.",
        wrongPassTitle: "Opps!",
        wrongPassCancelButtonText: "Cancel",
        passCodeVerify: (List<int> passcode) async {
          for (int i = 0; i < myPass.length; i++) {
            if (passcode[i] != myPass[i]) {
              return false;
            }
          }
          return true;
        },
        onSuccess: () {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (BuildContext context) {
            return EmptyPage();
          }));
        });
  }
}
