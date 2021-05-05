
import 'dart:ui';

import 'package:ctrl_geral/app_theme/app_themes.dart';
import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:ctrl_geral/login/login_bloc.dart';
import 'package:ctrl_geral/widgets/alerts/dialog_informativo.dart';
import 'package:ctrl_geral/widgets/progress/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size screenSize;

  bool podeEntrar = false;
  bool obcurecerSenha = true;
  Size dimencaoTela = WidgetsBinding.instance.window.physicalSize;

  int indiceAtual = 0;
  Widget cardMostrar;

  final _loginBloc = LoginBloc();


  final log = getLoggerStyle("_LoginScreenState");


  Logger logger = Logger(printer: LoggerStyle('LoginScreen'),
    // printer: PrettyPrinter(
    //     methodCount: 2,
    //     errorMethodCount: 8,
    //     lineLength: 50,
    //     colors: true,
    //     printEmojis: true,
    //     printTime: false),
  );



  @override
  void initState() {

    super.initState();
    // _log.fine("comecei a  rotina de initState",);
    cardMostrar = _signinCard();

    _loginBloc.outState.listen(
      (state) {
        switch (state) {
          case LoginState.SUCCESS:
            // logger.i('state1 $state');
            // Navigator.of(context).pushNamedAndRemoveUntil(Routes.HomePage, (Route<dynamic> route) => false);
            break;
          case LoginState.FAIL:
            // logger.i('state2 $state');

            // dialogoErro(context,"Acesso não concedido, Favor verificar" );
            // SnackBar(
            //   content: const Text('Acesso não concedido, Favor verificar'),
            //   action: SnackBarAction(
            //     label: 'Entendido',
            //     onPressed: () {
            //       // Code to execute.
            //     },
            //   ),
            // );

            break;
          case LoginState.LOADING:
            // logger.i('state3 $state');
            print("Aguarde um instante por favor!");
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: const Text('Aguarde um instante por favor!'),
            //     action: SnackBarAction(
            //       label: 'Entendido',
            //       onPressed: () {
            //         // Code to execute.
            //       },
            //     ),
            //   ),
            // );

            break;
          case LoginState.IDLE:
            // logger.i('state4 $state');
            // Navigator.of(context).pushNamed(Routes.LoginPage);

            break;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.dispose();
  }

  Widget _signinCard() {
    return Center(
      // key: UniqueKey(),
      child: Card(
        margin: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 0, left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<String>(
                stream: _loginBloc.outPassword,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onChanged: _loginBloc.changeEmail,
                      keyboardType: TextInputType.emailAddress,
                      // controller: emailController,
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                  );
                }),
            StreamBuilder<String>(
                stream: _loginBloc.outPassword,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: obcurecerSenha,
                      onChanged: _loginBloc.changePassword,
                      keyboardType: TextInputType.text,
                      // controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Senha",
                          suffixIcon: IconButton(
                              icon: Icon(obcurecerSenha
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                print("obscurecerSenha ${obcurecerSenha}");
                                setState(() {
                                  obcurecerSenha = !obcurecerSenha;
                                });
                                CircularProgressText(
                                    message: "Aguarde um instante por favor!");
                              })),
                    ),
                  );
                }),
            // loginButon,

            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(

                  primary: AppThemes.primaryDarkColor,
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  _loginBloc.signin(context);
                  // Navigator.pushNamed(context, Routes.homeScreen);
                },
                icon: Icon(Icons.login),
                label: Text("Entrar no sistema"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // onPrimary: Colors.blue,
                  primary: AppThemes.primaryLightColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    cardMostrar = _signupCard();
                  });
                },
                icon: Icon(Icons.person_add_alt_1_outlined),
                label: Text("Cadastrar novo usuario"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // onPrimary: Colors.blue,
                  primary: AppThemes.primaryLightColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(
                    () {
                      // _log.info("Recuperar senha",);
                      logger.i("mensagem de log1");
                      logger.d("mensagem de log2");
                      logger.e("mensagem de log3");
                      logger.v("mensagem de log4");
                      logger.e("mensagem de log5");
                      logger.w("mensagem de log6");
                      logger.wtf("mensagem de log7");
                      // dialogoInformativo(context,
                      //     "Desculpe o transtorno, esta rotina encontra-se em desenvolvimento.");
                    },
                  );
                },
                icon: Icon(Icons.vpn_key_outlined),
                label: Text("Recuperar Senha"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signupCard() {
    return Center(
      key: UniqueKey(),
      child: StreamBuilder<LoginState>(
          initialData: LoginState.LOADING,
          stream: _loginBloc.outState,
          builder: (context, snapshot) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      // controller: emailController,
                      decoration: InputDecoration(hintText: "Nome"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      // controller: emailController,
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      // controller: emailController,
                      decoration: InputDecoration(hintText: "Senha"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      // controller: emailController,
                      decoration:
                          InputDecoration(hintText: "Confirmar a senha"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.yellow,
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          cardMostrar;
                        });
                      },
                      icon: Icon(Icons.arrow_back),
                      label: Text("Retornar a tela anterior"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 0.0, right: 8.0, bottom: 0.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: AppThemes.primaryLightColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        dialogoInformativo(context,
                            "Desculpe o transtorno, esta rotina encontra-se em desenvolvimento.");
                      },
                      icon: Icon(Icons.save_alt),
                      label: Text("Guardar informações"),
                    ),
                  ),

                  // loginButon,
                ],
              ),
            );
          }),
    );
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
              _signinCard(),
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
