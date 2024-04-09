import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/appointment.dart';
import 'package:my_clinic_app/business_logic/models/sample_objects.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/components/misc/card_divider_line.dart';
import 'package:my_clinic_app/components/navigation_bar.dart';
import 'package:my_clinic_app/components/side_bar.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/screens/add_appointment/add_appointment_screen/add_appointment_screen.dart';
import 'package:my_clinic_app/screens/calendar/components/appointment_card.dart';
import 'package:my_clinic_app/screens/calendar/components/dropdown.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../size_config.dart';

class CalendarScreen extends StatefulWidget {
  static String routeName = "/calendar";

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  //table-calendar library controller
  CalendarController _calendarController;
  //Doctor appointments
  List<Appointment> appointments;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();

    //API CALL: TBD
    appointments = [sampleAppointment, sampleAppointment, sampleAppointment];
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: NavigationBar("CALENDAR"),
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.pushNamed(context, AddAppointmentScreen.routeName);
        },
        child: Icon(Icons.add),
        backgroundColor: kColor1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                calendarController: _calendarController,
                initialCalendarFormat: CalendarFormat.week,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Week',
                  CalendarFormat.week: 'Month',
                },
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: kColor1Dark),
                ),
                calendarStyle: CalendarStyle(
                  selectedColor: kColor1,
                  weekendStyle: TextStyle(color: kColor1Dark),
                  outsideWeekendStyle:
                      TextStyle(color: kColor1Dark.withOpacity(0.5)),
                  weekdayStyle: TextStyle(color: Colors.black),
                  todayColor: kColor1.withOpacity(0.4),
                  todayStyle: TextStyle(color: kColor1Dark),
                ),
              ),
              CardDividerLine(),
              Column(
                children: List.generate(appointments.length, (index) {
                  return AppointmentCard(appointments[index]);
                }),
              ),
              DropdownCard(),
            ],
          ),
        ),
      ),
      // drawer: SideBar(),
    );
  }
}
