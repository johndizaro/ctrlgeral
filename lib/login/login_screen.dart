import 'dart:ui';

import 'package:ctrl_geral/app_theme/app_themes.dart';
import 'package:ctrl_geral/logging/logger_style.dart';

import 'package:ctrl_geral/login/signin/cards/signin_card.dart';

import 'package:logger/logger.dart';

// import 'package:ctrl_geral/login/signin/cards/signin_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size screenSize;
  bool obcurecerSenha = true;
  Size dimencaoTela = WidgetsBinding.instance.window.physicalSize;

  Widget cardMostrar;

  Logger logger = Logger(
    printer: LoggerStyle('LoginScreen'),
  );

  @override
  void initState() {
    super.initState();
    // _log.fine("comecei a  rotina de initState",);
    cardMostrar = SigninCard();
  }


  @override
  void dispose() {
    super.dispose();
    // _loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.primaryColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(dimencaoTela.width),

              // bottomRight: Radius.circular(10.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ctrl Geral",
                style: TextStyle(
                    fontFamily: 'FasterOne',
                    fontSize: 40,
                    color: Colors.indigo,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(5.0, 5.0),
                        blurRadius: 5.0,
                        color: Colors.black26,
                      ),
                    ]),
              ),
              SigninCard(),
              // AnimatedSwitcher(
              //   duration: Duration(milliseconds: 800),
              //   // switchInCurve: Curves.bounceIn,
              //   // switchOutCurve: Curves.bounceInOut,
              //   transitionBuilder: (widget, animation) => ScaleTransition(
              //     scale: animation,
              //     child: widget,
              //   ),
              //
              //   child: _signinCard(),
              //
              //   // Container(
              //   //   child: Padding(
              //   //     padding: const EdgeInsets.all(8.0),
              //   //     child: Align(
              //   //       alignment: Alignment.topCenter,
              //   //       child: FloatingActionButton(
              //   //         onPressed: () {
              //   //           Navigator.pushNamed(
              //   //               context, RouteGenerator.homeScreenRoute);
              //   //         },
              //   //         child: Icon(Icons.login),
              //   //       ),
              //   //     ),
              //   //   ),
              //   // ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
