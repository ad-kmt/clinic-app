import 'package:flutter/material.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/screens/sign_in/sign_in_screen.dart';
import 'package:my_clinic_app/screens/splash/components/body.dart';
import 'package:my_clinic_app/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      backgroundColor: kColor2Light,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, SignInScreen.routeName);
        },
        child: Icon(Icons.navigate_next),
        backgroundColor: kColor2,
      ),
    );
  }
}
