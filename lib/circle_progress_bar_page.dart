import 'package:flutter/material.dart';
import 'package:testapp/widgets/progress_bar.dart';

class ProgressBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBarPage> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('CircleProgressBar'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            'Degree:${(progress * 360.0).round()}°',
            style: TextStyle(fontSize: 20.0),
          ),
          CircleProgressBar(
            radius: 150.0,
            dotColor: Colors.greenAccent,
            dotRadius: 10.0,
            shadowWidth: 2.0,
            dotEdgeColor: Colors.greenAccent,
            progress: 0.0,
            progressChanged: (value) {
              setState(() {
                progress = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
