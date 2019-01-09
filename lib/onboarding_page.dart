import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => new _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  SwiperController _swiperController;
  double prevOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _swiperController = SwiperController();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> swiperItemsList = [
      buildSwiperItem(
          "http://www.sushiwithgusto.com/wp-content/uploads/2016/11/uramaki_sushi-300rev.png",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec interdum eros, id luctus nisi",
          Color(0xFFfba457),
          firstGradient,
          "SOON?"),
      buildSwiperItem(
          "http://pngimg.com/uploads/donut/donut_PNG47.png",
          "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas",
          Color(0xFFffcc00),
          secondtGradient,
          "PROMOTIONS!"),
      buildSwiperItem(
          "https://toppng.com/public/uploads/preview/ice-cream-115283212700qrzu6fyi3.png",
          "Praesent quis euismod ante. Nunc sollicitudin justo id fermentum feugiat. ",
          Color(0xFFd18cd6),
          thirdGradient,
          "POSITION"),
    ];
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Expanded(
              flex: 6,
              child: Swiper(
                controller: _swiperController,
                itemCount: swiperItemsList.length,
                onIndexChanged: (int value) {
                  if (value == 2) {
                    setState(() {
                      prevOpacity = 0.0;
                    });
                  } else {
                    setState(() {
                      prevOpacity = 1.0;
                    });
                  }
                },
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: MediaQuery.of(context).size.height / 1.5,
                itemBuilder: (BuildContext context, index) {
                  return swiperItemsList[index];
                },
                layout: SwiperLayout.TINDER,
                curve: Curves.bounceOut,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            buildBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                print("prev");
                _swiperController.previous(animation: true);
                print(_swiperController.index.toString());
                setState(() {
                  prevOpacity = 0.0;
                });
              },
              child: Opacity(
                opacity: prevOpacity,
                child: Text(
                  "PREV",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("next");
                _swiperController.next(animation: true);
                print(_swiperController.index);
              },
              child: Text(
                "NEXT",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSwiperItem(String image, String text, Color color,
      Gradient gradient, String endText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400.withOpacity(0.8),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: gradient,
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 8),
                        )
                      ]),
                ),
                Image.network(
                  image,
                  fit: BoxFit.contain,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.3,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              endText,
              style: TextStyle(
                fontFamily: "Poppins",
                color: Colors.black12,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const firstGradient = LinearGradient(
  colors: [
    Color(0xFFfc792c),
    Color(0xFFfba457),
  ],
);

const secondtGradient = LinearGradient(
  colors: [
    Color(0xFFfeb700),
    Color(0xFFffcc00),
  ],
);

const thirdGradient = LinearGradient(
  colors: [
    Color(0xFFa978ad),
    Color(0xFFd18cd6),
  ],
);
