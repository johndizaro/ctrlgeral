import 'package:ctrl_geral/home/home_screen.dart';
import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:ctrl_geral/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Routes {
  static const String loginScreen = "login_screen.dart";
  static const String homeScreen = "home_screen.dart";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.homeScreen:
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
