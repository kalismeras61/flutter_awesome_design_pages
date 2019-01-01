import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

typedef void DeleteCode();
typedef Future<bool> CodeVerify(List<int> codes);

class LockScreen extends StatefulWidget {
  final VoidCallback onSuccess;
  final VoidCallback fingerFunction;
  final String title;
  final int codeLength;
  final Color backgroundColor;
  final String bgImage;
  final Color foregroundColor;
  final CodeVerify codeVerify;

  LockScreen(
      {this.onSuccess,
      this.title,
      this.backgroundColor,
      this.foregroundColor,
      this.codeLength = 4,
      this.codeVerify,
      this.fingerFunction,
      this.bgImage})
      : assert(title != null),
        assert(codeLength <= 4),
        assert(bgImage != null),
        assert(backgroundColor != null),
        assert(foregroundColor != null),
        assert(codeVerify != null),
        assert(onSuccess != null);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  var _currentCodeLength = 0;
  var _inputCodes = <int>[];
  var _currentState = 0;
  Color circleColor = Colors.white;

  _onCodeClick(int code) {
    if (_currentCodeLength < widget.codeLength) {
      setState(() {
        _currentCodeLength++;
        _inputCodes.add(code);
      });

      if (_currentCodeLength == widget.codeLength) {
        widget.codeVerify(_inputCodes).then((onValue) {
          if (onValue) {
            setState(() {
              _currentState = 1;
            });
            widget.onSuccess();
          } else {
            _currentState = 2;
            new Timer(new Duration(milliseconds: 1000), () {
              setState(() {
                _currentState = 0;
                _currentCodeLength = 0;
                _inputCodes.clear();
              });
            });
          }
        });
      }
    }
  }

  _deleteCode() {
    setState(() {
      if (_currentCodeLength > 0) {
        _currentState = 0;
        _currentCodeLength--;
        _inputCodes.removeAt(_currentCodeLength);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.white,
                    child: Stack(
                      children: <Widget>[
                        ClipPath(
                          clipper: BgClipper(),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.bgImage),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.grey.shade800,
                                  BlendMode.hardLight,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: Platform.isIOS ? 60 : 30,
                                ),
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: Platform.isIOS ? 50 : 30,
                                ),
                                CodePanel(
                                  codeLength: widget.codeLength,
                                  currentLength: _currentCodeLength,
                                  borderColor: widget.foregroundColor,
                                  deleteCode: _deleteCode,
                                  status: _currentState,
                                ),
                                SizedBox(
                                  height: Platform.isIOS ? 30 : 15,
                                ),
                                Text(
                                  "TYPE PASSCODE",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height /
                              (Platform.isIOS ? 4 : 5),
                          left: 20,
                          bottom: 10,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Center(
                                      child: Dialog(
                                        child: Container(
                                          height: 400,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 70.0),
                                                child: GestureDetector(
                                                  onTap: widget.fingerFunction,
                                                  child: Image.asset(
                                                    "images/fingerprint.png",
                                                    height: 100,
                                                    width: 100,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "Use Touch Id",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20),
                                              ),
                                              SizedBox(
                                                height: 80,
                                              ),
                                              Divider(
                                                height: 1,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: FlatButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  child: Text(
                                                    "CANCEL",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Image.asset(
                              "images/fingerprint.png",
                              height: 50,
                              width: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: Platform.isIOS ? 5 : 6,
                  child: Container(
                    padding: EdgeInsets.only(left: 0, top: 0),
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1.6,
                      mainAxisSpacing: 35,
                      padding: EdgeInsets.all(8),
                      children: <Widget>[
                        buildContainerCircle(1),
                        buildContainerCircle(2),
                        buildContainerCircle(3),
                        buildContainerCircle(4),
                        buildContainerCircle(5),
                        buildContainerCircle(6),
                        buildContainerCircle(7),
                        buildContainerCircle(8),
                        buildContainerCircle(9),
                        Text(""),
                        buildContainerCircle(0),
                        buildContainerIcon(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainerCircle(int number) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 0,
            )
          ]),
      child: Center(
        child: InkWell(
          onTap: () {
            _onCodeClick(number);
          },
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainerIcon() {
    return Container(
      height: 50,
      width: 50,
      decoration:
          BoxDecoration(color: circleColor, shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          spreadRadius: 0,
        )
      ]),
      child: Center(
        child: InkWell(
          onTap: () {
            if (0 < _currentCodeLength) {
              setState(() {
                circleColor = Colors.redAccent;
              });
              Future.delayed(Duration(milliseconds: 100)).then((func) {
                setState(() {
                  circleColor = Colors.white;
                });
              });
            }
            _deleteCode();
          },
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container buildNumberContainer() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class CodePanel extends StatelessWidget {
  final codeLength;
  final currentLength;
  final borderColor;
  final H = 30.0;
  final W = 30.0;
  final DeleteCode deleteCode;
  final int status;
  CodePanel(
      {this.codeLength,
      this.currentLength,
      this.borderColor,
      this.deleteCode,
      this.status})
      : assert(codeLength > 0),
        assert(currentLength >= 0),
        assert(currentLength <= codeLength),
        assert(deleteCode != null),
        assert(status == 0 || status == 1 || status == 2);

  @override
  Widget build(BuildContext context) {
    ///数字占位
    var circles = <Widget>[];
    var color = borderColor;
    if (status == 1) {
      color = Colors.green.shade500;
    }
    if (status == 2) {
      color = Colors.red.shade500;
    }
    for (int i = 1; i <= codeLength; i++) {
      if (i > currentLength) {
        circles.add(SizedBox(
            width: W,
            height: H,
            child: Container(
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(color: color, width: 1.0),
              ),
            )));
      } else {
        circles.add(new SizedBox(
            width: W,
            height: H,
            child: new Container(
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: new Border.all(color: color, width: 1.0),
                  color: color),
            )));
      }
    }
    var circlesRow = new SizedBox.fromSize(
        size: new Size(40.0 * codeLength, H),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: circles,
        ));

    return new SizedBox.fromSize(
      size: new Size(MediaQuery.of(context).size.width, 30.0),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[circlesRow]),
    );
  }
}
