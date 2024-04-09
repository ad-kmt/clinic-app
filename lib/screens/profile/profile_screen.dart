import 'package:flutter/material.dart';
import 'package:my_clinic_app/components/custom_bottom_nav_bar.dart';
import 'package:my_clinic_app/components/side_bar.dart';
import 'package:my_clinic_app/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      drawer: SideBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [Body()],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(
      //   selectedMenu: MenuState.profile,
      // ),
    );
  }
}
