import 'package:flutter/material.dart';
import 'package:testapp/widgets/general_card.dart';

class EnergyCardPage extends StatefulWidget {
  @override
  _EnergyCardPageState createState() => new _EnergyCardPageState();
}

class _EnergyCardPageState extends State<EnergyCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Control your energy!",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            childAspectRatio: 0.7,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            children: <Widget>[
              GeneralCard(
                title: "The Current Chart",
                date: "2018.12.24",
                kw: 189.2,
              ),
              GeneralCard(
                title: "The Second Chart",
                date: "2018.12.24",
                kw: 156.8,
              ),
              GeneralCard(
                date: "2018.12.24",
                title: "The Third Chart",
                kw: 155.2,
              ),
              GeneralCard(
                title: "The Four Chart",
                date: "2018.12.24",
                kw: 3956.2,
              ),
            ],
          ),
        ));
  }
}
