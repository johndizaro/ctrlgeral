import 'package:ctrl_geral/app_theme/app_themes.dart';
import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:ctrl_geral/login/authentication/auth_repository.dart';

import 'package:ctrl_geral/login/signin/bloc/signin_bloc.dart';
import 'package:ctrl_geral/login/signin/bloc/signin_state.dart';
import 'package:ctrl_geral/login/signin/bloc/signin_event.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SigninCard extends StatefulWidget {
  SigninCard({Key key}) : super(key: key);

  @override
  _SigninCardState createState() => _SigninCardState();
}

class _SigninCardState extends State<SigninCard> {
  bool obcurecerSenha = true;

  final _signinCardFormKey = GlobalKey<FormState>();

  Logger logger = Logger(
    printer: LoggerStyle('SigninCard'),
  );


  Widget _fieldEmail() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            // onChanged: _loginBloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                state.isValidUsername ? null : 'Senha inválida',
            onChanged: (value) => context.read<SigninBloc>().add(
                  SigninUsernameChanged(username: value),
                ),
            // controller: emailController,
            // validator: null,
            // onChanged: null,

            decoration: InputDecoration(

                // labelText: LoginFields().label(LoginFields.col00Email),
                // hintText: LoginFields().hint(LoginFields.col00Email),
                // errorText: snapshot.hasError ? snapshot.error : null,
                ),
          ),
        );
      },
    );
  }

  Widget _fieldPassword() {
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: obcurecerSenha,
            // onChanged: _loginBloc.changePassword,
            keyboardType: TextInputType.text,
            // controller: emailController,
            validator: (value) =>
                state.isValidPassword? null : 'Senha inválida',
            onChanged: (value) => context.read<SigninBloc>().add(
                  SigninPasswordChanged(password: value),
                ),
            decoration: InputDecoration(
                // labelText: LoginFields().label(LoginFields.col00Senha),
                // hintText: LoginFields().hint(LoginFields.col00Senha),
                // errorText: snapshot.hasError ? snapshot.error : null,
                suffixIcon: IconButton(
                    icon: Icon(obcurecerSenha
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      print("obscurecerSenha $obcurecerSenha");
                      setState(() {
                        obcurecerSenha = !obcurecerSenha;
                      });
                    })),
          ),
        );
      },
    );
  }

  Widget _buttonLogin() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
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
        onPressed: () async {
          logger.i("Entrar no sistema");
          // final snackBar = SnackBar(
          //   content: Container(
          //     child: Row(
          //       children: [
          //         Text("Aguarde um instante por favor..."),
          //         CircularProgressIndicator()
          //       ],
          //     ),
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // _loginBloc.signin(context);

          logger.i("É presuposto que entrei no sistema");

          // Navigator.pushNamed(context, Routes.homeScreen);
        },
        icon: Icon(Icons.login),
        label: Text("Entrar no sistema"),
      ),
    );
  }

  //
  // Widget _buttonSingup() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  //     child: ElevatedButton.icon(
  //       style: ElevatedButton.styleFrom(
  //         // onPrimary: Colors.blue,
  //         primary: AppThemes.primaryLightColor,
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(width: 1),
  //         ),
  //       ),
  //       onPressed: () {
  //         // setState(() {
  //         //   cardMostrar = SignupCard();
  //         // });
  //       },
  //       icon: Icon(Icons.person_add_alt_1_outlined),
  //       label: Text("Cadastrar novo usuario"),
  //     ),
  //   );
  // }
  //
  // Widget _buttonRecoverPassword() {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  //     child: ElevatedButton.icon(
  //       style: ElevatedButton.styleFrom(
  //         // onPrimary: Colors.blue,
  //         primary: AppThemes.primaryLightColor,
  //         shape: RoundedRectangleBorder(
  //           side: BorderSide(width: 1),
  //           borderRadius: BorderRadius.only(
  //             bottomLeft: Radius.circular(20),
  //             bottomRight: Radius.circular(20),
  //           ),
  //         ),
  //       ),
  //       onPressed: () {
  //         setState(
  //           () {
  //             // _log.info("Recuperar senha",);
  //             logger.i("mensagem de log1");
  //             logger.d("mensagem de log2");
  //             logger.e("mensagem de log3");
  //             logger.v("mensagem de log4");
  //             logger.e("mensagem de log5");
  //             logger.w("mensagem de log6");
  //             logger.wtf("mensagem de log7");
  //             // dialogoInformativo(context,
  //             //     "Desculpe o transtorno, esta rotina encontra-se em desenvolvimento.");
  //           },
  //         );
  //       },
  //       icon: Icon(Icons.vpn_key_outlined),
  //       label: Text("Recuperar Senha"),
  //     ),
  //   );
  // }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget card_Signin() {
    return Card(
      margin: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 0, left: 8.0),
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) {
          // TODO: implement listener}
        },
        child: Form(
          key: _signinCardFormKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _fieldEmail(),
                _fieldPassword(),
                _buttonLogin(),
                // _buttonSingup(),
                // _buttonRecoverPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // key: UniqueKey(),
      child: BlocProvider(
        create: (context) => SigninBloc(
          authRepository: context.read<AuthRepository>(),
        ),
        child: card_Signin(),
      ),
    );
  }
}
