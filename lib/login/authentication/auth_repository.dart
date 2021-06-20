import 'dart:async';
import 'package:ctrl_geral/logging/logger_style.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

enum AuthRepositoryStatus { unknown, authenticated, unauthenticated }

class AuthRepository  {
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

    logger.i(
        "_controller.stream ${_controller.stream} email $email  password, $password");

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (userCredential) async {
        user = userCredential.user;
        _controller.add(AuthRepositoryStatus.authenticated);

        // logger.i("entrar com userCredential.user ${userCredential.user}");
        logger.i("entrar com user $user");
      },
    ).catchError((onError) {
      logger.i('não entrou no sistema erro:$onError');
      _controller.add(AuthRepositoryStatus.unauthenticated);
    });
  }

  bool isLoggedIn() {
    logger.i("isLoggedIn user.email->$user");
    if (user != null) {
      return true;
    } else {
      return false;
    }
    // return user != null;
    // return user != null;
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
