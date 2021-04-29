import 'package:ctrl_geral/home/home_screen.dart';
import 'package:ctrl_geral/login/login_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String loginScreen = "/login/login_screen.dart";
  static const String homeScreen = "home/home_screen.dart";
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen(title: "Aqui fica o titulo",));
      default:
//        return _errorRoute('Rota não localizada: \n$settings.name');
        return null;
    }
  }
}
