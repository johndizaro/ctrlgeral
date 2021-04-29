// import 'package:ctrl_geral/home/home.dart';
// import 'package:ctrl_geral/home/home_screen.dart';
// import 'package:ctrl_geral/login/login_screen.dart';
//
// import 'package:flutter/material.dart';
//
// class RouteGenerator {
//   static const String authRoute = "/";
//   static const String homeRoute = "/home/home.dart";
//   static const String homeScreenRoute = "home/home_screen.dart";
//   static const String loginScreenRoute = "login/login_screen.dart";
//
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;
//
//     switch (settings.name) {
//       case homeRoute:
//         return MaterialPageRoute(builder: (_) => Home());
//       case homeScreenRoute:
//         return MaterialPageRoute(builder: (_) => HomeScreen(title: "liliana",));
//       case loginScreenRoute:
//         return MaterialPageRoute(builder: (_) => LoginScreen());
//
// //      case Routes.coremenu:
// //        if (args is String) {
// //          return MaterialPageRoute(builder: (_) => CoreMenu(data: args,),);
// //        }
// //        return _errorRoute('Argumento inválido: \n$args');
//       default:
//         return MaterialPageRoute(
//             builder: (_) => Scaffold(
//                   body: Container(
//                     child: Text("Rota não localizada ${settings.name}"),
//                   ),
//                 ));
//     }
//   }
// }
