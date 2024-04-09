import 'package:flutter/material.dart';
import 'package:my_clinic_app/routes.dart';
import 'package:my_clinic_app/screens/add_appointment/add_appointment_screen/add_appointment_screen.dart';
import 'package:my_clinic_app/screens/add_appointment/search_patient_screen/search_patient_screen.dart';
import 'package:my_clinic_app/screens/add_patient/add_patient_screen.dart';
import 'package:my_clinic_app/screens/calendar/calendar_screen.dart';
import 'package:my_clinic_app/screens/home/home_screen.dart';
import 'package:my_clinic_app/screens/login_success/login_success_screen.dart';
import 'package:my_clinic_app/screens/otp/otp_screen.dart';
import 'package:my_clinic_app/screens/profile/profile_screen.dart';
import 'package:my_clinic_app/screens/splash/splash_screen.dart';
import 'package:my_clinic_app/size_config.dart';
import 'package:my_clinic_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DocToDo',
      theme: theme(),
      // home: Home(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
