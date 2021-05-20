import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:ctrl_geral/login/authentication/auth_repository.dart';
import 'package:flutter/material.dart';
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

  @override
  void onTransition(Transition<SigninEvent, SigninState> transition) {
    logger.i("transition.event - ${transition.event}");
    logger.i("transition.currentState - ${transition.currentState}");
    logger.i("transition.nextState - ${transition.nextState}");
  }

  @override
  Stream<SigninState> mapEventToState(SigninEvent event) async* {
    // Username updated
    if (event is SigninUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password updated
    } else if (event is SigninPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form submitted
    } else if (event is SigninSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepository.signin();
        yield state.copyWith(formStatus: SubmissionSuccess());
        logger.i("await authRepository.signin() - executado com sucesso");
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
        logger.i("tivemos problemas para entrar");
      }
    }
  }
}
