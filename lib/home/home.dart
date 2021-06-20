import 'package:ctrl_geral/app_theme/app_themes.dart';
import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:ctrl_geral/login/authentication/auth_repository.dart';
import 'package:ctrl_geral/routes/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AuthRepository {
  String nomeEmpresa = "Quitutes da Lili";
  bool _autorizadaEntrada = false;

  // final AuthRepository _authRepository = AuthRepository();

  Logger logger = Logger(
    printer: LoggerStyle('Home'),
  );

  @override
  void initState() {
    _autorizadaEntrada = AuthRepository().isLoggedIn();
    logger.i("Entrada autorizadaEntrada $_autorizadaEntrada");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes().myAppTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute:
          _autorizadaEntrada ? Routes.routeHomeScreen : Routes.routeLoginScreen,
    );
  }
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: AppThemes().myAppTheme,
//     home: RepositoryProvider(
//       create: (context) => AuthRepository(),
//       // child: LoginScreen(),
//     ),
//     onGenerateRoute: RouteGenerator.generateRoute,
//     initialRoute: Routes.loginScreen,
//
//   );
// }
}
