import 'package:flutter/material.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/size_config.dart';

class SideBar extends PreferredSize {
  @override
  Size get preferredSize =>
      Size.fromWidth(getProportionateScreenWidth(250));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          SideBarHeader(),
        ],
      ),
    );
  }
}

class SideBarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(gradient: kPrimaryGradientColor),
      child: Row(
        children: [],
      ),
    );
  }
}
