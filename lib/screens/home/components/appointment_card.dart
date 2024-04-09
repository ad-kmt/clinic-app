import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_clinic_app/business_logic/models/appointment.dart';
import 'package:my_clinic_app/business_logic/utils/util.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/components/misc/card_divider_line.dart';

import '../../../constants.dart';

class AppointmentCard extends StatefulWidget {
  final Appointment appointment;

  AppointmentCard(this.appointment);

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Couldn't find any other way to achieve the layout. Need to check for other options - Aditya
      child: Column(
        children: [
          IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "${getTimeStringFromDateTime(widget.appointment.date)}",
                        style: TextStyle(
                          color: kTextDark2,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
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
                            "${widget.appointment.patient.firstName} ${widget.appointment.patient.lastName}",
                            style: TextStyle(
                              color: kTextDark1,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/doctor.svg',
                                width: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Doctor Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: kTextLight1,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Text(
                            "Visit Reason",
                            style: TextStyle(
                              color: kTextLight1,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
            ),
          ),
          CardDividerLine(),
        ],
      ),
    );
  }
}
