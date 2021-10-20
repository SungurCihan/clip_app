abstract class SignEvent {}

class RegisterFirstNameChanged extends SignEvent {
  final String? firstName;

  RegisterFirstNameChanged({this.firstName});
}

class RegisterLastNameChanged extends SignEvent {
  final String? lastName;

  RegisterLastNameChanged({this.lastName});
}

class RegisterMailChanged extends SignEvent {
  final String? mail;

  RegisterMailChanged({this.mail});
}

class RegisterPasswordChanged extends SignEvent {
  final String? password;

  RegisterPasswordChanged({this.password});
}

class RegisterPasswordRepeatChanged extends SignEvent {
  final String? passwordRepeat;

  RegisterPasswordRepeatChanged({this.passwordRepeat});
}

class RegisterPhoneNumberChanged extends SignEvent {
  final String? phoneNumber;

  RegisterPhoneNumberChanged({this.phoneNumber});
}

class RegistrationSubmitted extends SignEvent {}

class RegistrationNotSubmitted extends SignEvent {}
