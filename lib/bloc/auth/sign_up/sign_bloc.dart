import 'package:clip_app/bloc/auth/sign_up/sign_event.dart';
import 'package:clip_app/bloc/auth/sign_up/sign_state.dart';
import 'package:clip_app/models/user_for_register.dart';
import 'package:clip_app/models/user_response_model_for_pre.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import '../form_submission_status.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final AuthRepository authRepo;

  SignBloc({required this.authRepo}) : super(SignState());

  @override
  Stream<SignState> mapEventToState(SignEvent event) async* {
    // FirstName updated
    if (event is RegisterFirstNameChanged) {
      yield state.copyWith(firstName: event.firstName);

      // LastName updated
    } else if (event is RegisterLastNameChanged) {
      yield state.copyWith(lastName: event.lastName);

      // Mail updated
    } else if (event is RegisterMailChanged) {
      yield state.copyWith(email: event.mail);

      // Password updated
    } else if (event is RegisterPasswordChanged) {
      yield state.copyWith(password: event.password);

      // PasswordRepeat updated
    } else if (event is RegisterPasswordRepeatChanged) {
      yield state.copyWith(passwordRepeat: event.passwordRepeat);

      // Form submitted
    } else if (event is RegistrationSubmitted) {
      yield state.copyWith(formStatus: RegistrationSubmitting());

      try {
        UserForRegister userToRegister = UserForRegister(state.email,
            state.password, state.firstName, state.lastName, state.phoneNumber);

        UserResponseModelForPre response =
            await authRepo.registerforPreFlight(userToRegister);
        if (response.success == true) {
          yield state.copyWith(formStatus: RegistrationSuccess());
        } else if (response.success == false) {
          yield state.copyWith(
              formStatus: RegistrationFailed(response.message));
        }
      } catch (e) {
        yield state.copyWith(formStatus: RegistrationFailed(e));
      }
    } else if (event is RegistrationNotSubmitted) {
      yield state.copyWith(formStatus: NotRegistred());
      yield state.copyWith(formStatus: InitialFormStatus());
    }
  }
}
