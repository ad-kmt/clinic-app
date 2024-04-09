import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/screens/calendar/calendar_screen.dart';

class NavIconsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: kCardBoxDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: IconButtonWidget(
                iconName: "calendar",
                buttonName: "Calendar",
                onTap: () {
                  Navigator.pushNamed(context, CalendarScreen.routeName);
                },
              ),
            ),
            Expanded(
                flex: 1,
                child: IconButtonWidget(
                    iconName: "patient", buttonName: "Patients")),
            Expanded(
                flex: 1,
                child: IconButtonWidget(
                    iconName: "report", buttonName: "Reports")),
            Expanded(
                flex: 1,
                child: IconButtonWidget(iconName: "bill", buttonName: "Bills")),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class IconButtonWidget extends StatelessWidget {
  final String iconName;
  final String buttonName;
  var onTap;

  IconButtonWidget({Key key, this.iconName, this.buttonName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 6),
                child: SvgPicture.asset(
                  'assets/icons/$iconName.svg',
                ),
              ),
            ),
            Text(
              "$buttonName",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: kTextDark2,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
