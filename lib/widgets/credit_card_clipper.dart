import 'package:flutter/material.dart';

class CreditCardClipperFirst extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.36, 0);
    path.lineTo(size.width * 0.6, size.height / 3);
    path.lineTo(size.width * 0.6, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CreditCardClipperSecond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.7, 0);
    path.lineTo(size.width, size.height * 0.95);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
