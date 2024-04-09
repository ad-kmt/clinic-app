import 'package:flutter/material.dart';
import 'package:my_clinic_app/business_logic/models/patient.dart';
import 'package:my_clinic_app/business_logic/utils/util.dart';
import 'package:my_clinic_app/components/default_button.dart';
import 'package:my_clinic_app/components/navigation_bar.dart';
import 'package:my_clinic_app/components/side_bar.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/screens/add_patient/components/custom_radio_button.dart';

import '../../size_config.dart';

class AddPatientScreen extends StatefulWidget {
  static var routeName = "/add-patient-form";

  @override
  _AddPatientScreenState createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  Patient patient = Patient();
  String firstName;
  String lastName;
  int mobileNumber;
  String email;
  bool gender;
  DateTime dateOfBirth = DateTime.now();
  int age;
  String bloodGroup;
  String address;

  final FocusScopeNode formNode = FocusScopeNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Text Field Controllers
  final TextEditingController dateOfBirthTextController =
      TextEditingController();
  final TextEditingController ageTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController mobileTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  // final TextEditingController TextController = TextEditingController();

  // Gap between UI fields
  final double fieldGap = 30;

  // Shows Clear Buttons on every field if set to true
  bool showClearButtons = true;
  // Clear Buttons
  bool showFirstNameClearButton = false;
  bool showLastNameClearButton = false;
  bool showMobileClearButton = false;
  bool showEmailClearButton = false;
  bool showAgeClearButton = false;
  bool showDateOfBirthClearButton = false;

  // In case someone selects DOB, this will be set false (disabled)
  bool enableAgeField = true;

  List<RadioModel> genderOptions = new List<RadioModel>();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    dateOfBirthTextController.dispose();
    ageTextController.dispose();
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    mobileTextController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    genderOptions = [
      RadioModel(false, "Male"),
      RadioModel(false, "Female"),
    ];

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
        appBar: NavigationBar("ADD PATIENT"),
        backgroundColor: kBackgroundColor,
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(12),
              horizontal: getProportionateScreenWidth(12)),
          child: DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                print("Form Submitted");
                // print(patient);
                Navigator.pop(context);
                Navigator.pop(context, patient);
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
                height: 2.0, // sets the distance between label and input
              ),
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
                      buildFirstNameField(),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildLastNameField(),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildMobileNumberField(),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildEmailField(),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      buildGenderField(context),
                      SizedBox(
                        height: getProportionateScreenHeight(fieldGap),
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 3, child: buildDateOfBirthField(context)),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(40)),
                              child: Text("OR")),
                          Expanded(flex: 2, child: buildAgeField()),
                        ],
                      ),
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

  Widget buildFirstNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("First Name"),
        TextFormField(
          controller: firstNameTextController,
          keyboardType: TextInputType.name,
          onSaved: (newValue) => patient.firstName = newValue,
          validator: (value) {
            if (value.isEmpty) {
              return "Required";
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            // labelText: "First Name",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: getClearButton(
                showFirstNameClearButton, firstNameTextController),
          ),
        ),
      ],
    );
  }

  Widget buildLastNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Last Name"),
        TextFormField(
          controller: lastNameTextController,
          keyboardType: TextInputType.name,
          onSaved: (newValue) => patient.lastName = newValue,
          validator: (value) {
            if (value.isEmpty) {
              return "Required";
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            // labelText: "Last Name",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon:
                getClearButton(showLastNameClearButton, lastNameTextController),
          ),
        ),
      ],
    );
  }

  Widget buildMobileNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Mobile Number"),
        TextFormField(
          controller: mobileTextController,
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => patient.mobileNumber = int.tryParse(newValue),
          validator: (value) {
            if (value.isEmpty) {
              return null;
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            // labelText: "Mobile Number",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon:
                getClearButton(showMobileClearButton, mobileTextController),
          ),
        ),
      ],
    );
  }

  Widget buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Email"),
        TextFormField(
          controller: emailTextController,
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => patient.email = newValue,
          validator: (value) {
            if (value.isEmpty) {
              return null;
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            // labelText: "Email",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon:
                getClearButton(showEmailClearButton, emailTextController),
          ),
        ),
      ],
    );
  }

  Widget buildGenderField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Sex"),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
          children: [
            for (var item in genderOptions)
              Expanded(
                child: Ink(
                  child: InkWell(
                      onTap: () {
                        print("tapped");
                        setState(() {
                          if (item.isSelected) {
                            item.isSelected = false;
                          } else {
                            genderOptions.forEach((element) {
                              element.isSelected = false;
                            });
                            item.isSelected = !item.isSelected;
                            patient.gender = item.text;
                          }
                        });
                      },
                      child: CustomRadioButton(item)),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget buildDateOfBirthField(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime datePicked = await showDatePicker(
        context: context,
        initialDate: dateOfBirth,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.year,
      );
      if (datePicked != null && datePicked != dateOfBirth) {
        setState(() async {
          dateOfBirth = datePicked;
          dateOfBirthTextController.text =
              "${datePicked.day}-${datePicked.month}-${datePicked.year}";
          ageTextController.text = (await calculateAge(datePicked)).toString();

          setState(() {
            enableAgeField = false;
          });
        });
        setState(() {
          patient.dateOfBirth = datePicked;
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Date of Birth"),
        TextFormField(
          //disabled text selection
          enableInteractiveSelection: false,
          controller: dateOfBirthTextController,
          onTap: () {
            // Show Date Picker
            _selectDate(context);

            // Below line stops keyboard from appearing
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          validator: (value) {
            if (value.isEmpty) {
              return null;
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            // labelText: "Date of Birth",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: getDateOfBirthClearButton(),
          ),
        ),
      ],
    );
  }

  Widget buildAgeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildCustomLabel("Age"),
        TextFormField(
          controller: ageTextController,
          enabled: enableAgeField,
          keyboardType: TextInputType.number,
          onSaved: (newValue) => patient.age = int.tryParse(newValue),
          validator: (value) {
            if (value.isEmpty) {
              return null;
            }
            return null;
          },
          decoration: InputDecoration(
            // labelText: "Age",
            // hintText: "", //To keep space between label and input
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: getClearButton(showAgeClearButton, ageTextController),
          ),
        ),
      ],
    );
  }

  Widget buildBloodGroupField() {}

  Widget buildAddressField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "", //To keep space between label and input
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  Widget buildCityField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "City",
        hintText: "", //To keep space between label and input
      ),
    );
  }

  Widget buildPinCodeField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      validator: (value) {
        if (value.isEmpty) {
          return "Required";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Pincode",
        hintText: "", //To keep space between label and input
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
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

  Widget getDateOfBirthClearButton() {
    if (!showDateOfBirthClearButton) {
      return null;
    }
    return IconButton(
      onPressed: () {
        dateOfBirthTextController.clear();
        setState(() {
          enableAgeField = true;
          ageTextController.clear();
        });
      },
      icon: Icon(
        Icons.cancel_outlined,
        size: 16,
      ),
    );
  }

  initializeTextControllerListenersForClearButtons() {
    dateOfBirthTextController.addListener(() {
      setState(() {
        showDateOfBirthClearButton = dateOfBirthTextController.text.length > 0;
      });
    });

    ageTextController.addListener(() {
      setState(() {
        showAgeClearButton = ageTextController.text.length > 0;
      });
    });

    firstNameTextController.addListener(() {
      setState(() {
        showFirstNameClearButton = firstNameTextController.text.length > 0;
      });
    });

    lastNameTextController.addListener(() {
      setState(() {
        showLastNameClearButton = lastNameTextController.text.length > 0;
      });
    });

    mobileTextController.addListener(() {
      setState(() {
        showMobileClearButton = mobileTextController.text.length > 0;
      });
    });

    emailTextController.addListener(() {
      setState(() {
        showEmailClearButton = emailTextController.text.length > 0;
      });
    });
  }

  Widget buildCustomLabel(String label) => Text(
        label,
        style: TextStyle(
          color: kTextLight2,
          fontSize: 12,
        ),
      );
}
