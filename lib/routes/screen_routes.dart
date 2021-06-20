import 'package:ctrl_geral/home/home.dart';
import 'package:ctrl_geral/home/home_screen.dart';

import 'package:ctrl_geral/login/login_screen.dart';

import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';

class Routes {
  static const String routeHome = "home.dart";
  static const String routeLoginScreen = "login_screen.dart";
  static const String routeHomeScreen = "home_screen.dart";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.routeHome:
        return MaterialPageRoute(builder: (_) => Home());
      case Routes.routeLoginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.routeHomeScreen:
        // return MaterialPageRoute(builder: (_) => HomeScreen(title: "Aqui fica o titulo",));
        return MaterialPageRoute(builder: (_) => HomeScreen(title: args));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body:
                      Center(child: Text('Rota não definida ${settings.name}')),
                ));
    }
  }
}
