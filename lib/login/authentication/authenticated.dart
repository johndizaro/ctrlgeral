// import 'package:ctrl_geral/logging/logger_style.dart';
// import 'package:ctrl_geral/routes/screen_routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
//
// class AuthRepository with ChangeNotifier{
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//
//
//   // Firebase.Auth.FirebaseUser user;
//
//
//   Logger logger = Logger(
//     printer: LoggerStyle('AuthRepository'),
//   );
//
//   Future<void> login() async {
//     print('attempting login');
//     await Future.delayed(Duration(seconds: 3));
//     print('logged in');
//     throw Exception('failed log in');
//   }
//
//
//
//   Future<void> signin() async {
//     bool logado = false;
//     // final email = _emailController.value;
//     // final password = _passwordController.value;
//     // bool logado = false;
//     // print("${StackTrace.current.toString()}");
//     // logger.i("--->>>${StackTrace.current.toString()} - $email ");
//
//     await _firebaseAuth.authStateChanges().listen((User user) {
//       if (user == null) {
//         logger.i("usuario não logado");
//       } else {
//         logger.i("usuario está logado ${user}");
//          // Navigator.pushNamed(context, Routes.homeScreen);
//       }
//     });
//
//     if (logado == false) {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then(
//             (userCredential) {
//           Navigator.pushNamed(context, Routes.homeScreen);
//         },
//       ).catchError((onError) {
//         logger.i('${onError}');
//
//       });
//     }
//
//
//   }
//
//
//
// }
