import 'package:flutter/material.dart';

class ColoredCard extends StatefulWidget {
  final double cardHeight;
  final double padding;
  final bool showHeader;
  final bool showFooter;
  final Widget bodyContent;
  final HeaderBar headerBar;
  final FooterBar footerBar;
  final Color headerColor;
  final Color bodyColor;
  final Color footerColor;
  final Widget bottomContent;
  final double borderRadius;

  ColoredCard(
      {Key key,
      this.showHeader = true,
      this.showFooter = false,
      this.bodyContent,
      this.headerBar,
      this.footerBar,
      this.bottomContent,
      this.headerColor,
      this.bodyColor,
      this.footerColor,
      this.borderRadius,
      this.cardHeight = 200,
      this.padding = 20})
      : super(key: key);
  @override
  _ColoredCardState createState() => _ColoredCardState();
}

class _ColoredCardState extends State<ColoredCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.cardHeight,
      width: MediaQuery.of(context).size.width - widget.padding,
      decoration: BoxDecoration(
        color: widget.bodyColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Stack(
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
                child: Container(
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
          ClipPath(
            clipper: ColoredCardClipperSecond(),
            child: Container(
              color: Colors.white.withOpacity(0.07),
              height: widget.cardHeight,
            ),
          ),
        ],
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
  final double padding;

  HeaderBar(
      {Key key,
      this.leading,
      this.title,
      this.action,
      this.centerMiddle = true,
      this.backgroundColor,
      this.borderRadius,
      this.padding});
  @override
  Widget build(BuildContext context) {
    const double _kLeadingWidth = kToolbarHeight;
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            topRight: Radius.circular(borderRadius)),
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
        middle: title,
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

  FooterBar(
      {Key key,
      this.leading,
      this.title,
      this.action,
      this.centerMiddle = true,
      this.backgroundColor,
      this.borderRadius,
      this.padding});
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
        middle: title,
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

class ColoredCardClipperFirst extends CustomClipper<Path> {
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

class ColoredCardClipperSecond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(size.width * 0.5, 0);
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
