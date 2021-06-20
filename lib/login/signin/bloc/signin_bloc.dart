import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:ctrl_geral/login/authentication/auth_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../form_submission_status.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository authRepository;

  SigninBloc({this.authRepository}) : super(SigninState());

  Logger logger = Logger(
    printer: LoggerStyle('SigninBloc'),
  );

  // @override
  // void onTransition(Transition<SigninEvent, SigninState> transition) {
  //   logger.i("->1transition.event - ${transition.event}");
  //   logger.i("2transition.currentState - ${transition.currentState}");
  //   logger.i("3transition.nextState - ${transition.nextState}");
  // }

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // Username updated
    if (event is SigninUsernameChanged) {
      yield state.copyWith(username: event.username);
      logger.i("event - $event");

      // Password updated
    } else if (event is SigninPasswordChanged) {
      yield state.copyWith(password: event.password);
      logger.i("event - $event");

      // Form submitted
    } else if (event is SigninSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());
      logger.i("Form submitted event - $event");

      try {
        await authRepository.signin(
            password: state.password, email: state.username);
        yield state.copyWith(formStatus: SubmissionSuccess());

        logger.i("SubmissionSuccess - executado com sucesso");
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
        logger.i("SubmissionFailed $e");
      }
    }
  }
}
