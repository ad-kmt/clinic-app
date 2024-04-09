import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/patient.dart';
import 'package:my_clinic_app/components/misc/card_divider_line.dart';
import 'package:my_clinic_app/components/misc/profile_photo.dart';

import '../../../../constants.dart';

// ignore: must_be_immutable
class PatientCard extends StatefulWidget {
  final Patient patient;
  var onTap;

  PatientCard({Key key, @required this.patient, this.onTap})
      : assert(patient != null),
        super(key: key);

  @override
  _PatientCard createState() => _PatientCard();
}

class _PatientCard extends State<PatientCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x25000000),
                    offset: Offset(0, 1),
                    blurRadius: 2),
              ],
            ),
            child: InkWell(
              onTap: this.widget.onTap,
              child: buildPatientCard(),
            ),
          ),
          // CardDividerLine(),
        ],
      ),
    );
  }

  Widget buildPatientCard() {
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
                    "${widget.patient.firstName} ${widget.patient.lastName}",
                    style: TextStyle(
                      color: kTextDark1,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${widget.patient.gender}, ${widget.patient.age}",
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
        ],
      ),
    );
  }
}
