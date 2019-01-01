import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:testapp/energy_card.dart';
import 'package:testapp/pass_code_page.dart';

class FirstLoginPage extends StatefulWidget {
  @override
  _FirstLoginPageState createState() => new _FirstLoginPageState();
}

class _FirstLoginPageState extends State<FirstLoginPage> {
  Widget pageView() {
    return Swiper(
      containerHeight: 300,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/page_swiperbg.png",
                  fit: BoxFit.contain,
                  height: 80,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "GROMING",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lorem ipsum dolar sitLorem \n ipsum dolor sit amet",
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        );
      },
      itemCount: 3,
      pagination: SwiperPagination(
        builder: SwiperPagination.dots,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomBackClip(),
            child: Container(
              color: Colors.greenAccent.shade400,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  child: pageView(),
                ),
              ),
              Expanded(
                flex: 3,
                child: Card(
                  elevation: 0.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "tailslife",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Sign Up. You know you want to.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "It will take less than a minutes",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                child: Text(
                                  "LOG IN",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => EnergyCardPage(),
                                      ),
                                    ),
                              ),
                              Container(
                                height: 80,
                                width: 1,
                                color: Colors.grey.shade400,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => PassCodeScreen(),
                                      ),
                                    ),
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBackClip extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
