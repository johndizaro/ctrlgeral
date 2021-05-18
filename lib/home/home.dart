import 'package:ctrl_geral/app_theme/app_themes.dart';
import 'package:ctrl_geral/login/authentication/auth_repository.dart';
import 'package:ctrl_geral/login/authentication/authenticated.dart';
import 'package:ctrl_geral/login/login_screen.dart';
import 'package:ctrl_geral/routes/screen_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nomeEmpresa = "Quitutes da Lili";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes().myAppTheme,
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginScreen(),
      ),
      // onGenerateRoute: RouteGenerator.generateRoute,
      // initialRoute: Routes.loginScreen,

    );
  }
}
