import 'package:flutter/material.dart';
import 'package:testapp/widgets/general_wave_card.dart';

class AnimatedWaveCard extends StatefulWidget {
  @override
  _AnimatedWaveCardState createState() => _AnimatedWaveCardState();
}

class _AnimatedWaveCardState extends State<AnimatedWaveCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0d30c7),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          children: <Widget>[
            AnimatedWaveGeneralCard(
              height: 100,
              width: 100,
              actual: 6000,
              goal: 6000,
              waveColor: Colors.blue.shade300,
              cardBackgroundImage:
                  "https://cdn.pixabay.com/photo/2012/05/07/18/09/drop-48872_1280.png",
            ),
            AnimatedWaveGeneralCard(
              height: 80,
              width: 80,
              actual: 3000,
              goal: 6000,
              waveColor: Color(0xFF507d08),
            ),
            AnimatedWaveGeneralCard(
              height: 80,
              width: 80,
              actual: 1500,
              goal: 6000,
              waveColor: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
