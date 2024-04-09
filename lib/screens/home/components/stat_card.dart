import 'package:flutter/material.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/size_config.dart';

class StatCard extends StatelessWidget {
  final value;
  final description;

  StatCard(this.value, this.description);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: kCardBoxDecoration,
      width: getProportionateScreenWidth(140),
      height: getProportionateScreenHeight(85),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kTextLight2,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: kTextDark2,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
