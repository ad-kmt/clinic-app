import 'package:my_clinic_app/business_logic/models/doctor.dart';
import 'package:my_clinic_app/business_logic/models/patient.dart';

class Appointment {
  Patient patient;
  Doctor doctor;
  DateTime date;
  String procedures;
  String notes;

  Appointment();

  Appointment.patientAndDateTime(this.patient, this.date);

  @override
  String toString() {
    return 'Appointment{patient: $patient, doctor: $doctor, date: $date, procedures: $procedures, notes: $notes}';
  }
}
