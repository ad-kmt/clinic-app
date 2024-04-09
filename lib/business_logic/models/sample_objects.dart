import 'package:my_clinic_app/business_logic/models/patient.dart';
import 'appointment.dart';

Appointment sampleAppointment =
    Appointment.patientAndDateTime(samplePatient, DateTime.now());

Patient samplePatient = Patient.name("Aditya", "Kumawat");
