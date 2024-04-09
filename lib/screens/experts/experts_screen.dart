import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_clinic_app/screens/experts/components/body.dart';

class ExpertsScreen extends StatelessWidget {
  static String routeName = "/experts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
