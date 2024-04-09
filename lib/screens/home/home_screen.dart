import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:my_clinic_app/components/card_divider_line.dart';
// import 'package:my_clinic_app/components/navigation_bar.dart';

import 'package:my_clinic_app/components/side_bar.dart';
import 'package:my_clinic_app/screens/home/components/nav_icons_card.dart';
import 'package:my_clinic_app/screens/home/components/stat_card.dart';
import 'package:my_clinic_app/screens/home/components/upcoming_appointments.dart';

import '../../constants.dart';
import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List statsWeek = [
    {"description": "Patients", "value": "10"},
    {"description": "Appointments", "value": "15"},
    {"description": "Collections", "value": "5000"},
  ];

  List statsToday = [
    {"description": "Patients", "value": "2"},
    {"description": "Appointments", "value": "2"},
    {"description": "Collections", "value": "1000"},
  ];

  List statsMonth = [
    {"description": "Patients", "value": "60"},
    {"description": "Appointments", "value": "90"},
    {"description": "Collections", "value": "30000"},
  ];

  // change dropdown text here
  var dropDownItems = {
    "today": "Today",
    "week": "This Week",
    "month": "This Month"
  };

  // object containing lists of stat values for various durations(e.g today, this week, this month)
  var stats;

  @override
  void initState() {
    super.initState();
    //API CALL: TBD
    stats = {
      dropDownItems["today"]: statsToday,
      dropDownItems["week"]: statsWeek,
      dropDownItems["month"]: statsMonth
    };
  }

  String statsDurationValue = "This Week";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      // appBar: NavigationBar("DASHBOARD"),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(
                    defaultHorizontalPadding, 0, defaultHorizontalPadding, 2),
                child: DropdownButton<String>(
                  value: statsDurationValue,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  iconSize: 16,
                  elevation: 16,
                  style: TextStyle(
                    fontSize: 14,
                    color: kTextLight2,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      statsDurationValue = newValue;
                    });
                  },
                  underline: Container(
                    height: 1,
                    color: kColor2Dark,
                  ),
                  items: <String>[
                    dropDownItems["today"],
                    dropDownItems["week"],
                    dropDownItems["month"]
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:
                      List.generate(stats[statsDurationValue].length, (index) {
                    double paddingLeft =
                        (index == 0) ? defaultHorizontalPadding : 0;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          paddingLeft, 0, defaultHorizontalPadding, 0),
                      child: StatCard(stats[statsDurationValue][index]['value'],
                          stats[statsDurationValue][index]['description']),
                    );
                  }),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultHorizontalPadding, vertical: 12),
                child: Column(
                  children: [
                    UpcomingAppointments(),
                    Container(
                        padding: EdgeInsets.only(top: 12),
                        child: NavIconsCard()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: SideBar(),
    );
  }
}
