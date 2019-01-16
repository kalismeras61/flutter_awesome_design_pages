import 'package:flutter/material.dart';

class OtpLoginPage extends StatefulWidget {
  @override
  _OtpLoginPageState createState() => _OtpLoginPageState();
}

class _OtpLoginPageState extends State<OtpLoginPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 10,
              right: 10,
              bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          fontFamily: "Poppins",
                          color: Colors.black54,
                        ),
                      ),
                    )),
                Flexible(
                    flex: 10,
                    child: Image.asset(
                      "images/brown_teeth.png",
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  child: Container(
                    child: FittedBox(
                      fit: BoxFit.none,
                      alignment: Alignment.center,
                      child: Text(
                        "Enter Your Registered Mobile Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                    flex: 3,
                    child: FittedBox(
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.all(4),
                        width: MediaQuery.of(context).size.width - 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: TextField(
                          controller: _controller,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Your Mobile Number",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      "An OTP Has been sent on your registered mobile number",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  flex: 1,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => print("send otp"),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Center(
                      child: Text(
                        "Send OTP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1,
                        softWrap: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
