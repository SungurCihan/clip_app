import 'package:clip_app/models/user_for_login.dart';
import 'package:clip_app/models/user_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth_repository.dart';
import '../form_submission_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // Username updated
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        UserForLogin userToLogin = UserForLogin(state.username, state.password);

        UserResponseModel response = await authRepo.login(userToLogin);
        if (response.token != "") {
          yield state.copyWith(formStatus: SubmissionSuccess());
        } else if (response.token == "") {
          yield state.copyWith(
              formStatus: SubmissionFailed(
                  "Girdiğiniz bilgilere sahipp bir kullanıcıı bulunammmadı."));
        }
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    } else if (event is LoginNotSubmitted) {
      yield state.copyWith(formStatus: LoggedOut());
    }
  }
}
