// import 'dart:async';
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:ctrl_geral/logging/logger_style.dart';
// import 'package:ctrl_geral/login/login_validator.dart';
// import 'package:ctrl_geral/routes/firebase_route.dart';
// import 'package:ctrl_geral/routes/screen_routes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
//
// import 'package:rxdart/rxdart.dart';
//
// // enum LoginState { IDLE, LOADING, SUCCESS, FAIL }
//
// // enum LoginState { UNINITIALIZED, LOADING, AUTHENTICATED, UNAUTHENTICATED}
// // UNINITIALIZED — waiting to see if the user is authenticated or not on app start.
// // LOADING — waiting to persist/delete a token
// // AUTHENTICATED — successfully authenticated
// // UNAUTHENTICATED — not authenticated
//
// class LoginBloc extends BlocBase with LoginValidator {
//   // final log = getLoggerStyle("LoginBloc");
//   Logger logger = Logger(
//     printer: LoggerStyle('LoginScreen'),
//   );
//
//   final _emailController = BehaviorSubject<String>();
//   final _passwordController = BehaviorSubject<String>();
//   final _stateController = BehaviorSubject<LoginState>();
//
//   Stream<String> get outEmail {
//     return _emailController.stream.transform(validateEmail);
//   }
//
//   Stream<String> get outPassword {
//     return _passwordController.stream.transform(validatePassword);
//   }
//
//   Stream<LoginState> get outState {
//     return _stateController.stream;
//   }
//
//   Function(String) get changeEmail {
//     return _emailController.sink.add;
//   }
//
//   Function(String) get changePassword {
//     return _passwordController.sink.add;
//   }
//
//   Stream<bool> get outSubmitValid {
//     return Rx.combineLatest2(outEmail, outPassword, (a, b) => true);
//   }
//
//   StreamSubscription _streamSubscription;
//
//   LoginBloc() {
//     _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
//       (user) async {
//         logger.i(
//           'LoginBloc - user $user',
//         );
//         if (user != null) {
//           if (await verifyPrivileges(user)) {
//             logger.i("LoginBloc(OK) - user != null $user");
//             _stateController.add(LoginState.SUCCESS);
//           } else {
//             logger.i("LoginBloc(NOK)  user != null $user");
//             FirebaseAuth.instance.signOut().catchError((onError) {
//               logger.e('LoginBloc(NOK)  user != null $onError');
//             });
//             _stateController.add(LoginState.FAIL);
//           }
//         } else {
//           //logger.i("LoginBloc -idle-");
//           _stateController.add(LoginState.IDLE);
//         }
//       },
//     );
//   }
//
//   Future<void> signout() async {
//     await FirebaseAuth.instance.signOut().then((value) {
//       logger.i("saiu com sucesso");
//     }).catchError((onError) {
//       //logger.e("problemas ao sair onerror: $onError");
//     });
//   }
//
//   Future<void> signin(BuildContext context) async {
//     final email = _emailController.value;
//     final password = _passwordController.value;
//     bool logado = false;
//     print("${StackTrace.current.toString()}");
//     logger.i("--->>>${StackTrace.current.toString()} - $email ");
//
//     await FirebaseAuth.instance.authStateChanges().listen((User user) {
//       if (user == null) {
//         logado = false;
//         logger.i("usuario não logado");
//       } else {
//         logado = true;
//         Navigator.pushNamed(context, Routes.homeScreen);
//         //logger.i("usuario logado ${user}");
//       }
//     });
//     logger.i('${_stateController.value}');
//     if (logado == false) {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password)
//           .then(
//         (userCredential) {
//           // var user = userCredential.user;
//           //logger.i("userCredential - $user ");
//           Navigator.pushNamed(context, Routes.homeScreen);
//         },
//       ).catchError((onError) {
//         logger.i('${_stateController.value}');
//         //logger.e("onerror : $onError");
//         // snackbar(context, "aaaaaaaaa");
//         _stateController.add(LoginState.FAIL);
//       });
//     }
//
//     _stateController.add(LoginState.LOADING);
//   }
//
//   Future<bool> verifyPrivileges(User user) async {
//     //logger.i("verifyPrivileges - ${user.displayName}");
//     return await usuarioCaminho.doc(user.uid).get().then((doc) {
//       if (doc.data != null) {
//         return true;
//       } else {
//         return false;
//       }
//     }).catchError((e) {
//       return false;
//     });
//   }
//
//   @override
//   void dispose() {
//     _emailController.close();
//     _passwordController.close();
//     _stateController.close();
//
//     _streamSubscription.cancel();
//   }
// }
