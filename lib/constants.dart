import 'package:flutter/material.dart';

import 'size_config.dart';

//COLOR PALETTE

// API Stings
const String home_slider_url = "https://api.doroad.in/frontendClient/homeslide";


// Constants
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);

const kBackgroundColor = Color(0xFFF6F8F9);

const kColor1Dark = Color(0xFFFFB110);
const kColor1 = Color(0xFFFFDE6C);
const kColor1Light = Color(0xFFFFFBEC);

const kColor2Dark = Color(0xFF23B0B0);
const kColor2 = Color(0xFF34DEDE);
const kColor2Light = Color(0xFFF0FFFF);

const kColor3Dark = Color(0xFFAC4141);
const kColor3 = Color(0xFFF45656);
const kColor3Light = Color(0xFFFEEEEE);

const kColor4Dark = Color(0xFF415EB6);
const kColor4 = Color(0xFF567DF4);
const kColor4Light = Color(0xFFEEF7FE);

const kTextColor = Color(0xFF000000);
const kLightGrey = Color(0xFFDADADA);

const kTextLight1 = Color(0xFF979696);
const kTextLight2 = Color(0xFF636363);
const kTextDark1 = Color(0xFF474646);
const kTextDark2 = Color(0xFF383838);

const kCardDivider = Color(0xFFDADADA);
const kCardBorder = Color(0xFFDADADA);

const kAnimationDuration = Duration(milliseconds: 200);

//TEXT STYLES
final headingStyle = TextStyle(
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5);

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";

// OTP Input
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

// BORDER STYLES
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}

// BOX DECORATIONS

const kCardBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Color(0x10000000),
      blurRadius: 5,
      offset: Offset(
        0, // Move to right horizontally
        1, // Move to bottom Vertically
      ),
    )
  ],
);

//PADDING AND MARGINS
const double defaultHorizontalPadding = 12.0;
const double defaultVerticalPadding = 12.0;

//CONSTANT LENGTHS
const double appBarHeight = 56;
