import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  final VoidCallback onClick;

  const AnimatedFab({Key key, this.onClick}) : super(key: key);

  @override
  _AnimatedFabState createState() => new _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;

  final double expandedSize = 120.0;
  final double hiddenSize = 5.0;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _colorAnimation =
        new ColorTween(begin: Colors.deepOrange, end: Colors.deepOrange[800])
            .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: new AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildExpandedBackground(),
              _buildOption(Icons.check_circle, 0.0, widget.onClick),
              _buildOption(Icons.flash_on, -math.pi / 3, widget.onClick),
              _buildOption(Icons.access_time, -2 * math.pi / 3, widget.onClick),
              _buildOption(Icons.error_outline, math.pi, widget.onClick),
              _buildFabCore(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOption(IconData icon, double angle, VoidCallback onTap) {
    if (_animationController.isDismissed) {
      return Container();
    }
    double iconSize = 0.0;
    if (_animationController.value > 0.8) {
      iconSize = 20.0 * (_animationController.value - 0.8) * 5;
    }
    return new Transform.rotate(
      angle: angle,
      child: new Align(
        alignment: Alignment.topCenter,
        child: new IconButton(
          onPressed: onTap,
          icon: new Transform.rotate(
            angle: -angle,
            child: new Icon(
              icon,
              color: Colors.white,
            ),
          ),
          iconSize: iconSize,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  Widget _buildExpandedBackground() {
    double size = hiddenSize +
        (expandedSize - hiddenSize - 15) * _animationController.value;
    return new Container(
      height: size,
      width: size,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.deepOrange,
      ),
    );
  }

  Widget _buildFabCore() {
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return Container(
      height: 40,
      width: 40,
      child: new FloatingActionButton(
        heroTag: null,
        onPressed: _onFabTap,
        child: new Transform(
          alignment: Alignment.center,
          transform: new Matrix4.identity()..scale(1.0, scaleFactor),
          child: new Icon(
            _animationController.value > 0.5 ? Icons.close : Icons.filter_list,
            color: Colors.white,
            size: 26.0,
          ),
        ),
        backgroundColor: _colorAnimation.value,
      ),
    );
  }

  open() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    }
  }

  close() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }
}
