import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/appointment.dart';
import 'package:my_clinic_app/business_logic/models/doctor.dart';
import 'package:my_clinic_app/business_logic/models/patient.dart';
import 'package:my_clinic_app/business_logic/utils/util.dart';
import 'package:my_clinic_app/components/default_button.dart';
import 'file:///D:/ERP/Clinic/my_clinic_app/lib/screens/add_appointment/custom_label.dart';
import 'package:my_clinic_app/components/navigation_bar.dart';
import 'package:my_clinic_app/components/side_bar.dart';
import 'package:my_clinic_app/screens/add_appointment/search_doctor_screen/components/doctor_search_delegate.dart';
import 'package:my_clinic_app/screens/add_appointment/search_patient_screen/components/patient_search_card.dart';
import 'package:my_clinic_app/screens/add_appointment/search_patient_screen/components/patient_search_delegate.dart';
import 'package:my_clinic_app/screens/add_appointment/search_patient_screen/search_patient_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'components/doctor_card.dart';
import 'components/patient_card.dart';

class AddAppointmentScreen extends StatefulWidget {
  static var routeName = "/add-appointment-form";

  @override
  _AddAppointmentScreenState createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  // Form Fields
  Appointment appointment = Appointment();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Gap between UI fields
  final double fieldGap = 40;

  // Text Field Controllers
  final TextEditingController dateTextController = TextEditingController();
  final TextEditingController timeTextController = TextEditingController();
  final TextEditingController proceduresTextController =
      TextEditingController();
  final TextEditingController notesTextController = TextEditingController();

  // Shows Clear Buttons on every field if set to true
  bool showClearButtons = true;

  // Clear Buttons
  bool showDateClearButton = false;
  bool showTimeClearButton = false;
  bool showProceduresClearButton = false;
  bool showNotesClearButton = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    dateTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (showClearButtons) {
      initializeTextControllerListenersForClearButtons();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: NavigationBar("ADD APPOINTMENT"),
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(12),
            horizontal: getProportionateScreenWidth(12),
          ),
          child: DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print("Form Submitted");
                print(appointment);
              } else {
                print("Form Not Submitted");
                _formKey.currentState.save();
              }
            },
          ),
        ),
        body: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: kTextLight2),
              hintStyle: TextStyle(
                height: 1.0, // sets the distance between label and input
              ),
              // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      buildPatient(context),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildDoctor(context),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildDateField(context),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildTimeField(context),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildProceduresField(),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildNotesField(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        drawer: SideBar(),
      ),
    );
  }

  Widget buildPatient(BuildContext context) {
    return appointment.patient == null
        ? buildSearchPatientField(context)
        : buildPatientCard();
  }

  Widget buildSearchPatientField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Patient"),
        TextFormField(
          onTap: () async {
            // Below line stops keyboard from appearing and stops field from getting in focus
            FocusScope.of(context).requestFocus(new FocusNode());

            // SEARCH OPTION 1: EASY BUT LESS FLEXIBLE
            // Patient patientSelected = await showSearch(
            //     context: context, delegate: PatientSearchDelegate());

            // SEARCH OPTION 2: FROM SCRATCH
            Patient patientSelected = await Navigator.push(
              context,
              MaterialPageRoute<Patient>(
                builder: (context) => SearchPatientScreen(),
              ),
            );

            // NOT WORKING
            // var patientSelected = await Navigator.pushNamed(
            //     context, SearchPatientScreen.routeName);

            print("complete");
            print(patientSelected);

            setState(() {
              appointment.patient = patientSelected;
            });
          },
          // onSaved: (newValue) => patient.firstName = newValue,
          validator: (value) {
            if (value.isEmpty) {
              return "Required";
            }
            return null;
          },
          decoration: InputDecoration(
            // labelText: "Search Patient",
            // hintText: "",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(Icons.search),
            prefixIconConstraints:
                BoxConstraints(minWidth: getProportionateScreenWidth(40)),
          ),
        ),
      ],
    );
  }

  Widget buildPatientCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Patient"),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Stack(
          children: [
            PatientCard(
              patient: appointment.patient,
              onTap: () {},
            ),
            Container(
              padding: EdgeInsets.all(0),
              alignment: Alignment.topRight,
              child: IconButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  setState(() {
                    appointment.patient = null;
                  });
                },
                splashRadius: 12,
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 16,
                  color: kSecondaryColor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildDoctor(BuildContext context) {
    return appointment.doctor == null
        ? buildSearchDoctorField(context)
        : buildDoctorCard();
  }

  Widget buildSearchDoctorField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Doctor"),
        TextFormField(
          onTap: () async {
            // Below line stops keyboard from appearing and stops field from getting in focus
            FocusScope.of(context).requestFocus(new FocusNode());

            Doctor doctorSelected = await showSearch(
                context: context, delegate: DoctorSearchDelegate());
            setState(() {
              appointment.doctor = doctorSelected;
            });
          },
          // onSaved: (newValue) => patient.firstName = newValue,
          validator: (value) {
            if (value.isEmpty) {
              return "Required";
            }
            return null;
          },
          decoration: InputDecoration(
            // labelText: "Search Doctor",
            // hintText: "",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(Icons.search),
            prefixIconConstraints:
                BoxConstraints(minWidth: getProportionateScreenWidth(40)),
          ),
        ),
      ],
    );
  }

  Widget buildDoctorCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Doctor"),
        SizedBox(
          height: getProportionateScreenHeight(8),
        ),
        Stack(
          children: [
            DoctorCard(
              doctor: appointment.doctor,
              onTap: () {},
            ),
            Container(
              padding: EdgeInsets.all(0),
              alignment: Alignment.topRight,
              child: IconButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  setState(() {
                    appointment.doctor = null;
                  });
                },
                splashRadius: 12,
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 16,
                  color: kSecondaryColor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    Future<Null> _selectDate(BuildContext context) async {
      final DateTime datePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 1),
        initialDatePickerMode: DatePickerMode.day,
      );
      if (datePicked != null) {
        setState(() {
          dateTextController.text = "${getDateString(datePicked)}";
        });
        setState(() {
          appointment.date = datePicked;
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Date"),
        TextFormField(
          //disabled text selection
          enableInteractiveSelection: false,
          controller: dateTextController,
          onTap: () {
            // Below line stops keyboard from appearing
            FocusScope.of(context).requestFocus(new FocusNode());

            // Show Date Picker
            _selectDate(context);
          },
          validator: (value) {
            if (value.isEmpty) {
              return "Required";
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            // labelText: "Date",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: getClearButton(showDateClearButton, dateTextController),
          ),
        ),
      ],
    );
  }

  Widget buildTimeField(BuildContext context) {
    Future<void> _selectTime(BuildContext context) async {
      final TimeOfDay selectedTime = await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
      );
      if (selectedTime != null) {
        setState(() {
          timeTextController.text =
              "${getTimeStringFromTimeOfDay(selectedTime)}";
        });
        setState(() {
          appointment.date = DateTime(
              appointment.date == null
                  ? DateTime.now().year
                  : appointment.date.year,
              appointment.date == null
                  ? DateTime.now().month
                  : appointment.date.month,
              appointment.date == null
                  ? DateTime.now().day
                  : appointment.date.day,
              selectedTime.hour,
              selectedTime.minute);
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Time"),
        TextFormField(
          //disabled text selection
          enableInteractiveSelection: false,
          controller: timeTextController,
          onTap: () {
            // Below line stops keyboard from appearing
            FocusScope.of(context).requestFocus(new FocusNode());

            // Show Date Picker
            _selectTime(context);
          },
          validator: (value) {
            if (value.isEmpty) {
              return "Required";
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            // labelText: "Time",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: getClearButton(showTimeClearButton, timeTextController),
          ),
        ),
      ],
    );
  }

  Widget buildProceduresField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Procedures"),
        TextFormField(
          controller: proceduresTextController,
          keyboardType: TextInputType.name,
          onSaved: (newValue) => appointment.procedures = newValue,
          validator: (value) {
            if (value.isEmpty) {
              return null;
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            // labelText: "Procedures",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: getClearButton(
                showProceduresClearButton, proceduresTextController),
          ),
        ),
      ],
    );
  }

  Widget buildNotesField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Notes"),
        TextFormField(
          controller: notesTextController,
          keyboardType: TextInputType.name,
          onSaved: (newValue) => appointment.notes = newValue,
          validator: (value) {
            if (value.isEmpty) {
              return null;
            }
            return null;
          },
          textAlignVertical: TextAlignVertical.bottom,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            // labelText: "Notes",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon:
                getClearButton(showNotesClearButton, notesTextController),
          ),
        ),
      ],
    );
  }

  Widget getClearButton(_showClearButton, _textEditingController) {
    if (!_showClearButton) {
      return null;
    }
    return IconButton(
      onPressed: () => _textEditingController.clear(),
      icon: Icon(
        Icons.cancel_outlined,
        size: 16,
      ),
    );
  }

  initializeTextControllerListenersForClearButtons() {
    dateTextController.addListener(() {
      setState(() {
        showDateClearButton = dateTextController.text.length > 0;
      });
    });

    timeTextController.addListener(() {
      setState(() {
        showTimeClearButton = timeTextController.text.length > 0;
      });
    });

    proceduresTextController.addListener(() {
      setState(() {
        showProceduresClearButton = proceduresTextController.text.length > 0;
      });
    });

    notesTextController.addListener(() {
      setState(() {
        showNotesClearButton = notesTextController.text.length > 0;
      });
    });
  }
}
