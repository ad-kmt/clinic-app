import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/doctor.dart';
import 'package:my_clinic_app/business_logic/models/patient.dart';
import 'package:my_clinic_app/components/misc/card_divider_line.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/screens/add_appointment/search_patient_screen/components/patient_search_card.dart';

class PatientSearchDelegate extends SearchDelegate<Patient> {
  List<Patient> patientList = [
    Patient.name("Aditya", "Kumawat"),
    Patient.name("Aditya", "Verma"),
    Patient.name("Aditya", "Kumawat"),
    Patient.name("Aditya", "Verma"),
    Patient.name("Aditya", "Kapoor"),
    Patient.name("Amit", "Anand"),
    Patient.name("Amit", "Sharma"),
    Patient.name("Amit", "Bhadana"),
    Patient.name("Aditya", "Kumawat"),
    Patient.name("Aditya", "Verma"),
    Patient.name("Aditya", "Kapoor"),
    Patient.name("Amit", "Anand"),
    Patient.name("Amit", "Sharma"),
    Patient.name("Amit", "Bhadana"),
  ];

  List<Patient> recentPatientList = [
    Patient.name("Aditya", "Kumawat"),
    Patient.name("Amit", "Bhadana"),
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // return IconButton(
    //   icon: AnimatedIcon(
    //     icon: AnimatedIcons.menu_arrow,
    //     progress: transitionAnimation,
    //   ),
    //   onPressed: () {
    //     close(context, null);
    //   },
    // );
    return Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Patient> suggestionList =
        query.isEmpty ? recentPatientList : searchOperation(query);
    return Column(
      children: [
        // CardDividerLine(),
        Expanded(
          child: ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) => PatientSearchCard(
              patient: suggestionList[index],
              onTap: () {
                Navigator.pop(context, suggestionList[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  List<Patient> searchOperation(String searchText) {
    List<Patient> suggestionList = List();
    for (int i = 0; i < patientList.length; i++) {
      Patient data = patientList[i];
      if (data.toString().toLowerCase().contains(query.toLowerCase())) {
        suggestionList.add(data);
      }
    }
    return suggestionList;
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      /* We can change only these four, nothing else.
         So we'll need to change the underlying root theme
         or
         Use some third party library as theme manager
       */
      primaryTextTheme: ThemeData.light().primaryTextTheme,
      primaryColor: Colors.white,
      primaryIconTheme: theme.iconTheme.copyWith(color: Colors.grey),
      backgroundColor: Colors.white,
    );
  }
}
