import '../form_submission_status.dart';

class SignState {
  final String firstName;
  bool get isValidFirstName => firstName.length > 2;

  final String lastName;
  bool get isValidLastName => lastName.length > 2;

  final String email;
  bool get isValidEmail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 7;

  final String passwordRepeat;
  bool get isValidPassswordRepeat => passwordRepeat == password;

  final String phoneNumber;
  bool get isValidPhoneNummmber => passwordRepeat.length == 11;

  final FormSubmissionStatus formStatus;

  SignState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.passwordRepeat = '',
    this.phoneNumber = '05462254591',
    this.formStatus = const InitialFormStatus(),
  });

  SignState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? passwordRepeat,
    String? phoneNumber,
    FormSubmissionStatus? formStatus,
  }) {
    return SignState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordRepeat: passwordRepeat ?? this.passwordRepeat,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
