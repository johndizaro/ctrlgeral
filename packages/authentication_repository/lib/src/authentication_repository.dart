import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  // Future<void> logIn({
  //   required String username,
  //   required String password,
  // }) async {
  //   await Future.delayed(
  //     const Duration(milliseconds: 300),
  //         () => _controller.add(AuthenticationStatus.authenticated),
  //   );
  // }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {

    // await Future.delayed(
    //   const Duration(milliseconds: 300),
    //       () => _controller.add(AuthenticationStatus.authenticated),
    // );

    // await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password)
          .then((userCredential) {
        _controller.add(AuthenticationStatus.authenticated);
        // var user = userCredential.user;
      }).catchError((onError){print('john error FirebaseAuth' + onError);});
    // });
  }

  // Future<void> signin(BuildContext context) async {
  //   final email = _emailController.value;
  //   final password = _passwordController.value;
  //   bool logado = false;
  //
  //   await FirebaseAuth.instance.authStateChanges().listen((User user) {
  //     if (user == null) {
  //       logado = false;
  //
  //     } else {
  //       logado = true;
  //       Navigator.pushNamed(context, Routes.homeScreen);
  //
  //     }
  //   });
  //
  //   if (logado == false) {
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then(
  //           (userCredential) {
  //         var user = userCredential.user;
  //
  //         Navigator.pushNamed(context, Routes.homeScreen);
  //       },
  //     ).catchError((onError) {
  //
  //       _stateController.add(LoginState.FAIL);
  //     });
  //   }
  //
  //   _stateController.add(LoginState.LOADING);
  // }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
