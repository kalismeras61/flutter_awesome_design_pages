import 'package:flutter/material.dart';
import 'package:testapp/widgets/colored_card.dart';

class ColoredCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 20),
        child: ListView(
          children: <Widget>[
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
              borderRadius: 10,
              bodyColor: Color(0xFF6c8df6),
              showFooter: true,
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
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                action: IconButton(
                  icon: Icon(
                    Icons.menu,
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
                      "Maximize Tax detections and credits",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "Poppins"),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                action: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () => print("header button"),
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
              borderRadius: 10,
              bodyColor: Color(0xFF6c8df6),
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
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                      height: 90,
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
          ],
        ),
      ),
    );
  }
}
