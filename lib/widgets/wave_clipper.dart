import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' as Vector;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';

class ColorCurveBody extends StatefulWidget {
  final Size size;
  final double xOffset;
  final double yOffset;
  final Color color;
  ColorCurveBody({
    Key key,
    @required this.size,
    this.xOffset,
    this.yOffset,
    this.color,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ColorCurveBodyState();
  }
}

class _ColorCurveBodyState extends State<ColorCurveBody>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<Offset> animList1 = [];

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));
    animationController.addListener(() {
      animList1.clear();
      for (double i = 0; i <= widget.size.width.toInt(); i++) {
        animList1.add(Offset(
          i.toDouble(),
          sin(
                    (animationController.value * 360 - i) %
                        360 *
                        Vector.degrees2Radians,
                  ) *
                  4 +
              widget.yOffset +
              -10,
        ));
      }
    });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: new CurvedAnimation(
          parent: animationController,
          curve: Curves.bounceInOut,
        ),
        builder: (context, child) => new ClipPath(
              child: Container(
                width: 600,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.color,
                ),
              ),
              clipper: new WaveClipper(
                animationController.value,
                animList1,
              ),
            ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
