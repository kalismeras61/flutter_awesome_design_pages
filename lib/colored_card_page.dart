import 'package:flutter/material.dart';
import 'package:testapp/widgets/colored_card.dart';

class ColoredCardPage extends StatefulWidget {
  @override
  ColoredCardPageState createState() {
    return new ColoredCardPageState();
  }
}

class ColoredCardPageState extends State<ColoredCardPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Custom Colored Card"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "With Header and Footer Example",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold),
            ),
          ),
          ColoredCard(
            headerColor: Color(0xFF6078dc),
            footerColor: Color(0xFF6078dc),
            cardHeight: 250,
            elevation: 4,
            bodyColor: Color(0xFF6c8df6),
            showFooter: true,
            showHeader: true,
            bodyGradient: LinearGradient(
              colors: [
                Color(0xFF55affd).withOpacity(1),
                Color(0xFF6b8df8),
                Color(0xFF887ef1),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0, 0.2, 1],
            ),
            headerBar: HeaderBar(
                title: Text(
                  "Header Text",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "Poppins"),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Hello!'),
                    ));
                  },
                ),
                action: PopupMenuButton<String>(
                  icon: Icon(Icons.menu),
                  onSelected: choiceAction,
                  itemBuilder: (BuildContext context) {
                    return Constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                )),
            bodyContent: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 30,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Maximize Tax detections and credits",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "* State Additional",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\u{0024} 547.43',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            footerBar: FooterBar(
              title: Text(
                "Footer Text",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "Poppins"),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Only Header Example",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ColoredCard(
            headerColor: Color(0xFF4581c0),
            footerColor: Color(0xFF6078dc),
            cardHeight: 250,
            borderRadius: 30,
            bodyColor: Color(0xFF6c8df6),
            showHeader: true,
            showFooter: false,
            bodyGradient: LinearGradient(
              colors: [
                Color(0xFF82abe1).withOpacity(1),
                Color(0xFF4183cd),
                Color(0xFF166dbd),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0, 0.2, 1],
            ),
            headerBar: HeaderBar(
              title: Text(
                "Header Text",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  fontSize: 16,
                ),
              ),
              action: IconButton(
                icon: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                ),
                onPressed: () => print("header button"),
              ),
            ),
            bodyContent: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 30,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Investment and rental property price",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "* State Additional",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\u{0024} 800.98',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Only Footer Example",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ColoredCard(
            footerColor: Color(0xFF288990),
            cardHeight: 250,
            borderRadius: 10,
            showFooter: true,
            showHeader: false,
            bodyGradient: LinearGradient(
              colors: [
                Color(0xFF5cb3d1).withOpacity(1),
                Color(0xFF359da0),
                Color(0xFF188c75),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0, 0.2, 1],
            ),
            bodyContent: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 30,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Maximize Tax detections and credits",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "* State Additional",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\u{0024} 200.43',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            footerBar: FooterBar(
              title: Text(
                "Footer Text",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Only Body Example",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ColoredCard(
            cardHeight: 250,
            borderRadius: 5,
            showFooter: false,
            showHeader: false,
            bodyGradient: LinearGradient(
              colors: [
                Color(0xFFdb6f6f).withOpacity(1),
                Color(0xFFf6a69b),
                Color(0xFFdb6f6f),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0, 0.2, 1],
            ),
            bodyContent: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                top: 30,
                right: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Maximize Tax detections and credits",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "* State Additional",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\u{0024} 200.43',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.Settings) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          Constants.Settings,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ));
    } else if (choice == Constants.Subscribe) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
          Constants.Subscribe,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ));
    } else if (choice == Constants.SignOut) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(milliseconds: 200),
        content: Text(
          Constants.SignOut,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ));
    }
  }
}

class Constants {
  static const String Subscribe = 'Go Home Page';
  static const String Settings = 'Go Another Page';
  static const String SignOut = 'Refresh Page';

  static const List<String> choices = <String>[Subscribe, Settings, SignOut];
}
