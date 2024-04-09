import 'package:flutter/material.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/screens/sign_in/sign_in_screen.dart';
import 'package:my_clinic_app/size_config.dart';

import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "textOne": "Get",
      "textTwo": "Appointment \nNotifications",
      "textThree": "in hand",
      "image": "assets/images/splash_1.png"
    },
    {
      "textOne": "Fix",
      "textTwo": "your Schedule",
      "textThree": "anytime.",
      "image": "assets/images/splash_2.png"
    },
    {
      "textOne": "",
      "textTwo": "Track & Analysis",
      "textThree": "your growth",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                  child:  Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: kTextColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                textOne: splashData[index]["textOne"],
                textTwo: splashData[index]["textTwo"],
                textThree: splashData[index]["textThree"],
                image: splashData[index]["image"],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      splashData.length, (index) => buildDot(index: index)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 16,
      width: currentPage == index ? 48 : 16,
      decoration: BoxDecoration(
          color: currentPage == index ? kColor2 : kColor1,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(0, 1),
              blurRadius: 1,
            )
          ],
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
