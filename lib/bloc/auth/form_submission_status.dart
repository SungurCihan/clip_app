abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

//Login

class FormSubmitting extends FormSubmissionStatus {}

class LoggedOut extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final Object exception;

  SubmissionFailed(this.exception);
}

//Register

class RegistrationSubmitting extends FormSubmissionStatus {}

class NotRegistred extends FormSubmissionStatus {}

class RegistrationSuccess extends FormSubmissionStatus {}

class RegistrationFailed extends FormSubmissionStatus {
  final Object? excepiton;

  RegistrationFailed(this.excepiton);
}
