import 'dart:ui';

import 'package:flutter/material.dart';

class ColoredCard extends StatefulWidget {
  final double cardHeight;
  final double padding;
  final double elevation;
  final bool showHeader;
  final bool showFooter;
  final Widget bodyContent;
  final Gradient bodyGradient;
  final HeaderBar headerBar;
  final FooterBar footerBar;
  final Color headerColor;
  final Color bodyColor;
  final Color footerColor;
  final Widget bottomContent;
  final double borderRadius;

  ColoredCard(
      {Key key,
      this.showHeader = false,
      this.showFooter = false,
      this.bodyContent,
      this.bodyGradient,
      this.headerBar,
      this.footerBar,
      this.bottomContent,
      this.headerColor,
      this.bodyColor,
      this.footerColor,
      this.borderRadius = 0.0,
      this.elevation = 0.0,
      this.cardHeight = 200,
      this.padding = 10})
      : super(
          key: key,
        );
  @override
  _ColoredCardState createState() => _ColoredCardState();
}

class _ColoredCardState extends State<ColoredCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.padding, right: widget.padding),
      child: Material(
        type: MaterialType.card,
        elevation: widget.elevation,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Container(
          height: widget.cardHeight,
          decoration: BoxDecoration(
            color: widget.bodyColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: widget.bodyGradient,
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  widget.showHeader
                      ? HeaderBar(
                          title: widget.headerBar.title,
                          action: widget.headerBar.action,
                          centerMiddle: widget.headerBar.centerMiddle,
                          backgroundColor: widget.headerColor,
                          leading: widget.headerBar.leading,
                          borderRadius: widget.borderRadius,
                          padding: widget.padding,
                        )
                      : Container(),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width - widget.padding,
                      child: widget.bodyContent,
                    ),
                  ),
                  widget.showFooter
                      ? FooterBar(
                          title: widget.footerBar.title,
                          action: widget.footerBar.action,
                          centerMiddle: widget.footerBar.centerMiddle,
                          backgroundColor: widget.footerColor,
                          leading: widget.footerBar.leading,
                          borderRadius: widget.borderRadius,
                          padding: widget.padding,
                        )
                      : Container(),
                ],
              ),
              ClipOval(
                clipper: ColoredCardClipperFirst(widget.cardHeight),
                child: Container(
                  color: Colors.white.withOpacity(0.05),
                  height: widget.cardHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final Widget action;
  final bool centerMiddle;
  final Color backgroundColor;
  final double borderRadius;
  final Gradient gradient;
  final double padding;

  HeaderBar({
    Key key,
    this.leading,
    this.title,
    this.action,
    this.centerMiddle = true,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.gradient,
  });
  @override
  Widget build(BuildContext context) {
    const double _kLeadingWidth = kToolbarHeight;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        gradient: gradient,
      ),
      height: kToolbarHeight - 15,
      width: MediaQuery.of(context).size.width - padding,
      child: NavigationToolbar(
        leading: Container(
          height: kToolbarHeight - 15,
          width: _kLeadingWidth,
          child: leading,
        ),
        centerMiddle: centerMiddle,
        middle: title != null ? title : "null",
        trailing: Container(
          height: kToolbarHeight - 15,
          width: _kLeadingWidth,
          child: action,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class FooterBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final Widget title;
  final Widget action;
  final bool centerMiddle;
  final Color backgroundColor;
  final double borderRadius;
  final double padding;
  final Gradient gradient;

  FooterBar(
      {Key key,
      this.leading,
      this.title,
      this.action,
      this.centerMiddle = true,
      this.backgroundColor,
      this.borderRadius,
      this.padding,
      this.gradient});
  @override
  Widget build(BuildContext context) {
    const double _kLeadingWidth = kToolbarHeight;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        gradient: gradient,
      ),
      height: kToolbarHeight - 15,
      width: MediaQuery.of(context).size.width - padding,
      child: NavigationToolbar(
        leading: Container(
          height: kToolbarHeight - 15,
          width: _kLeadingWidth,
          child: leading,
        ),
        centerMiddle: centerMiddle,
        middle: title != null ? title : "null",
        trailing: Container(
          height: kToolbarHeight - 15,
          width: _kLeadingWidth,
          child: action,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class ColoredCardClipperFirst extends CustomClipper<Rect> {
  final double radius;
  ColoredCardClipperFirst(this.radius);

  @override
  Rect getClip(Size size) {
    Rect rect =
        Rect.fromCircle(center: Offset(-20, size.height + 40), radius: radius);

    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class ColoredCardClipperSecond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.7, size.height * .8);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
