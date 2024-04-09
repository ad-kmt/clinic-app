import 'package:flutter/material.dart';
import 'package:my_clinic_app/constants.dart';

class ProfilePhoto extends StatelessWidget {
  final double size;

  ProfilePhoto({Key key, this.size = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: kLightGrey,
      child: Icon(
        Icons.person,
        size: size + 4,
        color: Colors.white,
      ),
    );
  }
}
