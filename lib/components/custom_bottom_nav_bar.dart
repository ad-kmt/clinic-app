import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/enums.dart';
import 'package:my_clinic_app/screens/home/home_screen.dart';
import 'package:my_clinic_app/screens/profile/profile_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15))
          ]),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kColor2
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kColor2
                    : inActiveIconColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kColor2
                    : inActiveIconColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Heart Icon.svg",
                color: MenuState.profile == selectedMenu
                    ? kColor2
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
