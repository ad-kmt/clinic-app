import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/appointment.dart';
import 'package:my_clinic_app/business_logic/models/sample_objects.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/components/misc/card_divider_line.dart';
import 'package:my_clinic_app/screens/calendar/calendar_screen.dart';
import 'package:my_clinic_app/screens/home/components/appointment_card.dart';

import '../../../constants.dart';

class UpcomingAppointments extends StatefulWidget {
  @override
  _UpcomingAppointmentsState createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  List<Appointment> appointments;

  @override
  void initState() {
    super.initState();

    //API CALL: TBD
    appointments = [sampleAppointment, sampleAppointment];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kCardBoxDecoration,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Appointments".toUpperCase(),
                  style: TextStyle(
                    color: kTextLight1,
                  ),
                ),
                Spacer(),
                Text(
                  "Fri, 25 Dec".toUpperCase(),
                  style: TextStyle(
                    color: kTextLight1,
                  ),
                ),
              ],
            ),
          ),
          CardDividerLine(),
          Column(
            children: List.generate(appointments.length, (index) {
              return AppointmentCard(appointments[index]);
            }),
          ),
          Container(
            child: Row(
              children: [
                Spacer(),
                Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CalendarScreen.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16),
                      child: Text(
                        "view all".toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: kColor2Dark,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
