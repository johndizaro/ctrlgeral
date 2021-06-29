import 'package:authentication_repository/authentication_repository.dart';
import 'package:ctrl_geral/app.dart';
import 'package:flutter/widgets.dart';
import 'package:user_repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}
