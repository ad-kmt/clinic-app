import 'package:flutter/material.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/size_config.dart';

class NavigationBar extends PreferredSize {
  final String title;

  NavigationBar(this.title);

  @override
  Size get preferredSize =>
      Size.fromHeight(getProportionateScreenHeight(appBarHeight));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kColor4,
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Colors.white),
      ),
    );
  }
}
