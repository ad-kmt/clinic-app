import 'package:flutter/widgets.dart';
import 'package:my_clinic_app/business_logic/models/sample_objects.dart';
import 'package:my_clinic_app/screens/add_appointment/add_appointment_screen/add_appointment_screen.dart';
import 'package:my_clinic_app/screens/add_patient/add_patient_screen.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/screens/add_appointment/search_patient_screen/search_patient_screen.dart';
import 'package:my_clinic_app/screens/calendar/calendar_screen.dart';
import 'package:my_clinic_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:my_clinic_app/screens/experts/experts_screen.dart';
import 'package:my_clinic_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:my_clinic_app/screens/home/home_screen.dart';
import 'package:my_clinic_app/screens/home_layout/home_layout.dart';
import 'package:my_clinic_app/screens/login_success/login_success_screen.dart';
import 'package:my_clinic_app/screens/otp/otp_screen.dart';
import 'package:my_clinic_app/screens/profile/profile_screen.dart';
import 'package:my_clinic_app/screens/sign_in/sign_in_screen.dart';
import 'package:my_clinic_app/screens/sign_up/sign_up_screen.dart';
import 'package:my_clinic_app/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  //LOGIN AND INTRO
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeLayout.routeName: (context) => HomeLayout(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),


  //MAIN SCREENS
  HomeScreen.routeName: (context) => HomeScreen(),
  ExpertsScreen.routeName: (context) => ExpertsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  CalendarScreen.routeName: (context) => CalendarScreen(),
  SearchPatientScreen.routeName: (context) => SearchPatientScreen(),
  AddPatientScreen.routeName: (context) => AddPatientScreen(),
  AddAppointmentScreen.routeName: (context) => AddAppointmentScreen(),
};
