import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/patient.dart';
import 'package:my_clinic_app/components/misc/card_divider_line.dart';
import 'package:my_clinic_app/components/side_bar.dart';
import 'package:my_clinic_app/screens/add_patient/add_patient_screen.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/screens/add_appointment/search_patient_screen/components/patient_search_card.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchPatientScreen extends StatefulWidget {
  static var routeName = "/search-patient";

  @override
  _SearchPatientScreenState createState() => _SearchPatientScreenState();
}

class _SearchPatientScreenState extends State<SearchPatientScreen> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey();
  final TextEditingController searchTextController = TextEditingController();

  List<Patient> patientList;
  bool isSearching;
  List<Patient> searchResult = new List();

  @override
  void initState() {
    super.initState();
    isSearching = true;

    //initialize patient list
    initializePatientList();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: globalKey,
      drawer: SideBar(),
      backgroundColor: kBackgroundColor,
      body: GestureDetector(
        //To change focus from search bar to screen.
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              buildAppBar(context),
              buildSearchBar(context),
              buildNewPatientButton(context),
              searchResult.length != 0 || searchTextController.text.isNotEmpty
                  ? buildSearchResult(context)
                  : buildCompleteList(context),
            ],
          ),
        ),
      ),
    );
  }

  void initializePatientList() {
    patientList = List();
    patientList.add(Patient.name("Aditya", "Kumawat"));
    patientList.add(Patient.name("Aditya", "Verma"));
    patientList.add(Patient.name("Aditya", "Kapoor"));
    patientList.add(Patient.name("Amit", "Anand"));
    patientList.add(Patient.name("Amit", "Sharma"));
    patientList.add(Patient.name("Amit", "Bhadana"));
    patientList.add(Patient.name("Aditya", "Kumawat"));
    patientList.add(Patient.name("Aditya", "Verma"));
    patientList.add(Patient.name("Aditya", "Kapoor"));
    patientList.add(Patient.name("Amit", "Anand"));
    patientList.add(Patient.name("Amit", "Sharma"));
    patientList.add(Patient.name("Amit", "Bhadana"));
  }

  Widget buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kColor4,
      expandedHeight: getProportionateScreenHeight(56),
      toolbarHeight: getProportionateScreenHeight(56),
      iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      ),
      shape: Border(bottom: BorderSide(width: 0, color: kColor4)),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          globalKey.currentState.openDrawer();
        },
      ),
      title: Text(
        "ADD APPOINTMENT",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Colors.white),
      ),
      pinned: false,
      floating: true,
    );
  }

  Widget buildSearchBar(BuildContext context) {
    return new SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kColor4,
      expandedHeight: getProportionateScreenHeight(60),
      toolbarHeight: getProportionateScreenHeight(60),
      titleSpacing: 0,
      title: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(
          defaultHorizontalPadding,
          getProportionateScreenHeight(10),
          defaultHorizontalPadding,
          getProportionateScreenHeight(10),
        ),
        child: Container(
          alignment: Alignment.center,
          height: getProportionateScreenHeight(40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchTextController,
                  style: TextStyle(
                    color: kTextLight2,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.clear,
                      ),
                      onPressed: () {
                        searchTextController.clear();
                        setState(() {
                          searchResult.clear();
                        });
                      },
                    ),
                    contentPadding: EdgeInsets.fromLTRB(
                        0, getProportionateScreenHeight(3), 0, 0),
                    hintText: "Search for patients...",
                    hintStyle: TextStyle(color: kTextLight1),
                  ),
                  onChanged: searchOperation,
                ),
              ),
            ],
          ),
        ),
      ),
      pinned: true,
    );
  }

  Widget buildSearchResult(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return PatientSearchCard(patient: searchResult[index]);
        },
        childCount: searchResult.length,
      ),
    );
  }

  Widget buildCompleteList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return PatientSearchCard(
            patient: patientList[index],
            onTap: () {
              Navigator.pop(context, patientList[index]);
            },
          );
        },
        childCount: patientList.length,
      ),
    );
  }

  Widget buildNewPatientButton(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: defaultHorizontalPadding,
              vertical: 12,
            ),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  // Patient newPatient = await Navigator.push(
                  //   context,
                  //   MaterialPageRoute<Patient>(
                  //     builder: (context) => AddPatientScreen(),
                  //   ),
                  // );
                  // Navigator.pop(context, newPatient);
                  Navigator.pushNamed(context, AddPatientScreen.routeName);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  primary: kColor2Dark,
                  backgroundColor: Colors.white,
                  elevation: 0.6,
                ),
                child: Text(
                  "+ APPOINTMENT FOR NEW PATIENT",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          CardDividerLine(),
        ],
      ),
    );
  }

  // void _handleSearchStart() {
  //   setState(() {
  //     _isSearching = true;
  //   });
  // }
  //
  // void _handleSearchEnd() {
  //   setState(() {
  //     _isSearching = false;
  //     _controller.clear();
  //   });
  // }

  void searchOperation(String searchText) {
    searchResult.clear();
    if (isSearching != null) {
      for (int i = 0; i < patientList.length; i++) {
        Patient data = patientList[i];
        if (data.toString().toLowerCase().contains(searchText.toLowerCase())) {
          setState(() {
            searchResult.add(data);
          });
        }
      }
    }
  }
}
