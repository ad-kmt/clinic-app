import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/screens/experts/experts_screen.dart';
import 'package:my_clinic_app/screens/home/home_screen.dart';
import 'package:my_clinic_app/screens/profile/profile_screen.dart';


class HomeLayout extends StatefulWidget {
  static String routeName = "/homelayout";

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  final tabs = [
    Home(),
    ExpertsScreen(),
    Center(child: Text("Share")),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: _currentIndex == 0 ? kColor2 : inActiveIconColor,
              width: 24,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                  color: _currentIndex == 0 ? kColor2 : inActiveIconColor,
                  fontWeight: _currentIndex == 0 ? FontWeight.bold : null),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/mylist.svg",
              color: _currentIndex == 1 ? kColor2 : inActiveIconColor,
              width: 24,
            ),
            title: Text(
              "Favourites",
              style: TextStyle(
                  color: _currentIndex == 1 ? kColor2 : inActiveIconColor,
                  fontWeight: _currentIndex == 1 ? FontWeight.bold : null),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/share.svg",
              color: _currentIndex == 2 ? kColor2 : inActiveIconColor,
              width: 24,
            ),
            title: Text(
              "Share",
              style: TextStyle(
                  color: _currentIndex == 2 ? kColor2 : inActiveIconColor,
                  fontWeight: _currentIndex == 2 ? FontWeight.bold : null),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/user.svg",
              color: _currentIndex == 3 ? kColor2 : inActiveIconColor,
              width: 24,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                  color: _currentIndex == 3 ? kColor2 : inActiveIconColor,
                  fontWeight: _currentIndex == 3 ? FontWeight.bold : null),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
