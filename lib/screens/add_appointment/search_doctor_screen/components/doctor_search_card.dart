import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/doctor.dart';
import 'package:my_clinic_app/components/misc/card_divider_line.dart';
import 'package:my_clinic_app/components/misc/profile_photo.dart';

import '../../../../constants.dart';

// ignore: must_be_immutable
class DoctorSearchCard extends StatefulWidget {
  final Doctor doctor;
  var onTap;

  DoctorSearchCard({Key key, @required this.doctor, this.onTap})
      : assert(doctor != null),
        super(key: key);

  @override
  _DoctorSearchCardState createState() => _DoctorSearchCardState();
}

class _DoctorSearchCardState extends State<DoctorSearchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Ink(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: InkWell(
              onTap: this.widget.onTap,
              child: buildDoctorCard(),
            ),
          ),
          CardDividerLine(),
        ],
      ),
    );
  }

  Widget buildDoctorCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              ProfilePhoto(),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.doctor.firstName} ${widget.doctor.lastName}",
                    style: TextStyle(
                      color: kTextDark1,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${widget.doctor.speciality}",
                    style: TextStyle(
                      color: kTextLight1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: kTextLight2,
          ),
        ],
      ),
    );
  }
}
