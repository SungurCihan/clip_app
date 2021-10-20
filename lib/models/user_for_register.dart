import 'package:equatable/equatable.dart';

class UserForRegister extends Equatable {
  late String email;
  late String password;
  late String firstName;
  late String lastName;
  late String phoneNumber;

  UserForRegister(this.email, this.password, this.firstName, this.lastName,
      this.phoneNumber);

  UserForRegister.withoutPhoneNuber(
      this.email, this.password, this.firstName, this.lastName);

  UserForRegister.fromJson(Map json) {
    email = json["email"];
    password = json["password"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    phoneNumber = json["phoneNumber"];
  }

  Map toJson() {
    return {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber
    };
  }

  @override
  List<Object?> get props =>
      [email, firstName, lastName, password, phoneNumber];
}
