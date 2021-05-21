import 'package:ctrl_geral/logging/logger_style.dart';
// import 'package:ctrl_geral/routes/screen_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthRepository {
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
      {@required String email , @required String password}) async {
    logger.i("signin email $email  password, $password");

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (userCredential) {
        var user = userCredential.user;

        logger.i("entrar no sistema ${userCredential.user}");
        // Navigator.pushNamed(context, Routes.homeScreen);
      },
    ).catchError((onError) {
      logger.i('${onError}');
    });
  }
}
