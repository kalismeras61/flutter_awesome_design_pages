import 'package:flutter/material.dart';
import 'package:testapp/widgets/colored_card.dart';

class ColoredCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColoredCard(
          headerColor: Color(0xFF6078dc),
          footerColor: Colors.yellow,
          cardHeight: 250,
          borderRadius: 10,
          bodyColor: Color(0xFF6c8df6),
          showFooter: false,
          headerBar: HeaderBar(
            title: Text("Header Text",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "This is test content",
                )
              ],
            ),
          ),
          footerBar: FooterBar(
            title: Text("Header Text",
                style: TextStyle(
                  color: Colors.black26,
                )),
            leading: Icon(
              Icons.settings,
              color: Colors.black12,
            ),
            action: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black12,
              ),
              onPressed: () => print("header button"),
            ),
          ),
        ),
      ),
    );
  }
}
