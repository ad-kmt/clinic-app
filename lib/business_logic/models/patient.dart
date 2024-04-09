class Patient {
  String firstName;
  String lastName;
  String gender = "Male";
  DateTime dateOfBirth;
  int age = 20;
  int mobileNumber;
  String email;
  String address;
  String bloodGroup;

  @override
  String toString() {
    return 'Patient{firstName: $firstName, lastName: $lastName, gender: $gender, dateOfBirth: $dateOfBirth, age: $age, mobileNumber: $mobileNumber, email: $email, address: $address, bloodGroup: $bloodGroup}';
  }

  Patient();
  Patient.name(this.firstName, this.lastName);
}
