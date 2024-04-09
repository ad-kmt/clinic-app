class Doctor {
  String firstName;
  String lastName;
  String speciality = "MBBS";

  @override
  String toString() {
    return 'Doctor{firstName: $firstName, lastName: $lastName}';
  }

  Doctor();
  Doctor.name(this.firstName, this.lastName);
  Doctor.nameAndSpeciality(this.firstName, this.lastName, this.speciality);
}
