import 'package:ctrl_geral/app_theme/app_themes.dart';
// import 'package:ctrl_geral/home/home_screen.dart';
import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:ctrl_geral/login/authentication/auth_repository.dart';

import 'package:ctrl_geral/login/signin/bloc/signin_bloc.dart';
import 'package:ctrl_geral/login/signin/bloc/signin_state.dart';
import 'package:ctrl_geral/login/signin/bloc/signin_event.dart';
import 'package:ctrl_geral/login/signin/form_submission_status.dart';
import 'package:ctrl_geral/routes/screen_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SigninCard extends StatefulWidget {
  SigninCard({Key key}) : super(key: key);

  @override
  _SigninCardState createState() => _SigninCardState();
}

class _SigninCardState extends State<SigninCard> with AuthRepository {
  bool obcurecerSenha = true;

  final _signinCardFormKey = GlobalKey<FormState>();
  // AuthRepository authRepository = AuthRepository();
  // FormSubmitting formSubmitting = FormSubmitting();

  Logger logger = Logger(
    printer: LoggerStyle('SigninCard'),
  );

  Widget _fieldEmail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) {
          return TextFormField(
            // onChanged: _loginBloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                state.isValidUsername ? null : 'Email inválido',
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
          );
        },
      ),
    );
  }

  Widget _fieldPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) {
          return TextFormField(
            obscureText: obcurecerSenha,
            // onChanged: _loginBloc.changePassword,
            keyboardType: TextInputType.text,
            // controller: emailController,
            validator: (value) {
              return state.isValidPassword ? null : 'Senha inválida';
            },

            onChanged: (value) {
              return context.read<SigninBloc>().add(
                    SigninPasswordChanged(password: value),
                  );
            },
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
          );
        },
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    AuthRepository().dispose();
   
    // _loginBloc.dispose();
  }
  Widget _buttonSignin() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
      child: BlocBuilder<SigninBloc, SigninState>(
        buildWhen: (previous, current) =>
            previous.formStatus != current.formStatus,
        builder: (context, state) {
          return state.formStatus is FormSubmitting
              ? CircularProgressIndicator()
              : ElevatedButton.icon(
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
                    logger.i("state.formStatus ${state.formStatus}");
                    logger.i(
                        "_authRepository.status ${AuthRepositoryStatus.authenticated}");
                    // if (_signinCardFormKey.currentState.validate()) {
                    //   context.read<SigninBloc>().add(SigninSubmitted());
                    //
                    // }
                    // Navigator.pop(context);
                    // Navigator.popUntil(context, ModalRoute.withName(Routes.routeHome));
                    // await authRepository.signin(email: 'johndizaro@gmail.com', password: 'aaaaaaaa');
                    await signin(
                        email: "johndizaro@gmail.com", password: "aaaaaaaa");

                    Navigator.popAndPushNamed(context, Routes.routeHome);
                    // ModalRoute.withName(Routes.routeHome);

                    // authRepository.outState.listen((state) {
                    //   switch (state){
                    //     case AuthRepositoryStatus.authenticated:
                    //       logger.i(' 1AuthRepositoryStatus.authenticated $state');
                    //       break;
                    //     case  AuthRepositoryStatus.unauthenticated:
                    //       logger.i(' 2AuthRepositoryStatus.unauthenticated $state');
                    //       break;
                    //     case  AuthRepositoryStatus.unknown:
                    //       logger.i(' 3AuthRepositoryStatus.unknown $state');
                    //       break;
                    //     default:
                    //       logger.i(' 4AuthRepositoryStatus.unknown $state');
                    //       break;
                    //   }
                    // });

                    // logger.i("onPressed AuthRepository().getStreamValue() ${AuthRepository().getStreamValue()}");

                    // authRepository.myStream.listen((event) {
                    //     logger.i("onPressed 3 event ${event}");
                    //  }).onDone(() {logger.i("onPressed 4 event on donne"); });

                    // if (1 != null){
                    //   Navigator.of(context).pushNamed(Routes.homeScreen,arguments: "Ctrl Controle Geral");
                    // }

                    // if (state.formStatus is SubmissionSuccess){
                    //    Navigator.of(context).pushNamed(Routes.homeScreen,arguments: "Ctrl Controle Geral");
                    //    logger.i("entra ${state.username}, ${state.password}");
                    //   // Navigator.pushNamed(context, Routes.homeScreen,arguments: "asd");
                    //   // Navigator.push(
                    //   //   context,
                    //   //   MaterialPageRoute(builder: (context) => HomeScreen(title: "aaaaa",)),
                    //   // );
                    // }
                    // if(state.formStatus is SubmissionSuccess) {
                    //   logger.i("onPressed1:ok  state.formStatus ${state.formStatus}");
                    //
                    //   // Navigator.pushNamed(context, Routes.homeScreen);
                    //   Navigator.of(context).pushNamed(Routes.homeScreen);
                    //   logger.i("onPressed2:ok  state.formStatus ${state.formStatus}");
                    //
                    //
                    // } else {
                    //   logger.i("onPressed:nok state.formStatus ${state.formStatus}");
                    // }

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
                  },
                  icon: Icon(Icons.login),
                  label: Text("Entrar no sistema"),
                );
        },
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

  // void _showSnackBar(BuildContext context, String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  Widget cardSignin() {
    return Card(
      margin: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 0, left: 8.0),
      child: BlocProvider(
        create: (context) {
          return SigninBloc(
            authRepository: RepositoryProvider.of<AuthRepository>(context),
          );
        },
        child: Form(
          key: _signinCardFormKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _fieldEmail(),
                _fieldPassword(),
                _buttonSignin(),
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
      child: cardSignin(),
    );
  }
}
