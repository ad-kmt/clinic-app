import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}

String getTimeStringFromDateTime(DateTime date) {
  return "${DateFormat.jm().format(date)}".padLeft(8, "0");
}

String getTimeStringFromTimeOfDay(TimeOfDay timeOfDay) {
  DateTime date = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, timeOfDay.hour, timeOfDay.minute);
  return "${DateFormat.jm().format(date)}".padLeft(8, "0");
}

String getDateString(DateTime date) {
  return DateFormat('EEEE, d MMM, yyyy').format(date);
}
