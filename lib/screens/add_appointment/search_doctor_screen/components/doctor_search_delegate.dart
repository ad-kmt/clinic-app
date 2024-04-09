import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/doctor.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/screens/add_appointment/search_doctor_screen/components/doctor_search_card.dart';

class DoctorSearchDelegate extends SearchDelegate<Doctor> {
  List<Doctor> doctorList = [
    Doctor.name("Sam", "Sebastian"),
    Doctor.name("Jake", "Peralta"),
    Doctor.name("Amy", "Santiago"),
    Doctor.name("Rosa", "Diaz"),
  ];

  List<Doctor> recentDoctorList = [
    Doctor.name("Jake", "Peralta"),
    Doctor.name("Amy", "Santiago"),
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
    List<Doctor> suggestionList =
        query.isEmpty ? recentDoctorList : searchOperation(query);
    return Column(
      children: [
        // CardDividerLine(),
        Expanded(
          child: ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) => DoctorSearchCard(
              doctor: suggestionList[index],
              onTap: () {
                Navigator.pop(context, suggestionList[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  List<Doctor> searchOperation(String searchText) {
    List<Doctor> suggestionList = List();
    for (int i = 0; i < doctorList.length; i++) {
      Doctor data = doctorList[i];
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
