import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_clinic_app/business_logic/models/appointment.dart';
import 'package:my_clinic_app/business_logic/utils/util.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/components/misc/card_divider_line.dart';
import 'package:my_clinic_app/constants.dart';

class AppointmentCard extends StatefulWidget {
  final Appointment appointment;

  AppointmentCard(this.appointment);

  @override
  _AppointmentCardState createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  bool isDropdownOpened = false;

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
                          Text(
                            "Visit Reason",
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
                  IconButton(
                    icon: isDropdownOpened
                        ? Icon(Icons.keyboard_arrow_up_rounded)
                        : Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        isDropdownOpened = !isDropdownOpened;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          CardDividerLine(),
          AnimatedCrossFade(
            duration: Duration(milliseconds: 200),
            firstChild: AppointmentDropdownCard(),
            secondChild: SizedBox(),
            crossFadeState: isDropdownOpened
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
          // isDropdownOpened ? AppointmentDropdownCard() : SizedBox(),
        ],
      ),
    );
  }
}

class AppointmentDropdownCard extends StatefulWidget {
  @override
  _AppointmentDropdownCardState createState() =>
      _AppointmentDropdownCardState();
}

class _AppointmentDropdownCardState extends State<AppointmentDropdownCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            color: Colors.white,
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButtonWidget("cancel", "Cancel"),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButtonWidget("no_show", "No show"),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButtonWidget("follow_up", "Follow up"),
                        ),
                      ],
                    ),
                  ),
                ),
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButtonWidget("edit", "Edit"),
                        ),
                        Expanded(
                          flex: 1,
                          child:
                              IconButtonWidget("call_patient", "Call Patient"),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButtonWidget("bill_black", "Add Bill"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        CardDividerLine(),
      ],
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  final String iconName;
  final String buttonName;

  IconButtonWidget(this.iconName, this.buttonName);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(),
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
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
