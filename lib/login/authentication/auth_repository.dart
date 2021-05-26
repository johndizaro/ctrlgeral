import 'dart:async';
import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

enum AuthRepositoryStatus { unknown, authenticated, unauthenticated }

class AuthRepository {
  final _controller = StreamController<AuthRepositoryStatus>();
  User user;

  Stream<AuthRepositoryStatus> get outState => _controller.stream;
  // Stream<LoginState> get outState => _stateController.stream;


  Stream<AuthRepositoryStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthRepositoryStatus.unauthenticated;
    yield* _controller.stream;
  }

  Logger logger = Logger(
    printer: LoggerStyle('AuthRepository'),
  );

  // Future<void> signin() async {
  //   print('attempting signin');
  //   await Future.delayed(Duration(seconds: 3));
  //   print('signin');
  //   throw Exception('failed signin');
  // }

  Future<void> signin(
      {@required String email, @required String password}) async {
    logger.i("signin status.last ${_controller.stream}");
    logger.i("signin email $email  password, $password");

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
          (userCredential) async {
        user = userCredential.user;
        _controller.add(AuthRepositoryStatus.authenticated);

        logger.i(
            "entrar no sistema userCredential.user ${userCredential.user}");
      },
    ).catchError((onError) {
      logger.i('não entrou no sistema${onError}');
      _controller.add(AuthRepositoryStatus.unauthenticated);
    });
  }

  // Stream<AuthRepositoryStatus>  getStreamValue() async* {
  //
  // _controller.stream.listen((event) {
  //   logger.i('event ${event}');
  //
  // });
  // }

  void logOut() {
    _controller.add(AuthRepositoryStatus.unauthenticated);
  }

  void dispose() {
    _controller.close();
  }
}
