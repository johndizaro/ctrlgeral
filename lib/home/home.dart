import 'package:ctrl_geral/app_theme/app_themes.dart';
import 'package:ctrl_geral/routes/screen_routes.dart';

import 'package:flutter/material.dart';


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
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Routes.loginScreen,

    );
  }
}
