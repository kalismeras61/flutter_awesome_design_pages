import 'package:flutter/material.dart';
import 'package:testapp/widgets/wave_clipper.dart';
import 'package:flutter/widgets.dart';

class AnimatedWaveGeneralCard extends StatefulWidget {
  final int goal;
  final int actual;
  final double height;
  final double width;
  final Color boxColor;
  final Color waveColor;
  final String cardBackgroundImage;
  final timeDilation;

  AnimatedWaveGeneralCard({
    this.actual,
    this.goal,
    this.width,
    this.height,
    this.boxColor = Colors.white24,
    this.waveColor,
    this.timeDilation = 2.0,
    this.cardBackgroundImage,
  })  : assert(width != null),
        assert(height != null),
        assert(goal != null),
        assert(actual != null);

  @override
  _AnimatedWaveGeneralCardState createState() =>
      _AnimatedWaveGeneralCardState();
}

class _AnimatedWaveGeneralCardState extends State<AnimatedWaveGeneralCard> {
  @override
  Widget build(BuildContext context) {
    Size size = new Size(MediaQuery.of(context).size.width, 300);
    double yOfset;
    double minyOfset = 0;
    double maxyOfset = 200;
    if (widget.goal == widget.actual) {
      setState(() {
        yOfset = minyOfset;
      });
    } else if (widget.actual == 0) {
      setState(() {
        yOfset = maxyOfset;
      });
    } else if (widget.actual == widget.goal / 2) {
      setState(() {
        yOfset = 100;
      });
    } else if (widget.actual == widget.goal / 4) {
      {
        setState(() {
          yOfset = 150;
        });
      }
    }
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: widget.height,
          width: widget.height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.boxColor,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ColorCurveBody(
                size: size,
                xOffset: 0,
                yOffset: yOfset,
                color: widget.waveColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Goal : ",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.goal.toString(),
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.actual.toString(),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Steps",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
