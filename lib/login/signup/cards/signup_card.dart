// import 'package:ctrl_geral/app_theme/app_themes.dart';
// import 'package:ctrl_geral/widgets/alerts/dialog_informativo.dart';
import 'package:flutter/material.dart';

class SignupCard extends StatefulWidget {
  SignupCard({Key key}) : super(key: key);

  @override
  _SignupCardState createState() => _SignupCardState();
}

class _SignupCardState extends State<SignupCard> {
  bool obcurecerSenha = true;

  Widget _fieldName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.name,
        // controller: emailController,
        decoration: InputDecoration(hintText: "Nome"),
      ),
    );
  }

  Widget _fieldEmail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        // controller: emailController,
        decoration: InputDecoration(hintText: "Email"),
      ),
    );
  }

  Widget _fieldPassword1() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obcurecerSenha,
        // onChanged: _loginBloc.changePassword,
        keyboardType: TextInputType.text,
        // controller: emailController,
        decoration: InputDecoration(
            // errorText: snapshot.hasError ? snapshot.error : null,
            suffixIcon: IconButton(
                icon: Icon(
                    obcurecerSenha ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  print("obscurecerSenha $obcurecerSenha");
                  setState(() {
                    obcurecerSenha = !obcurecerSenha;
                  });
                })),
      ),
    );
  }

  Widget _fieldPassword2() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obcurecerSenha,
        // onChanged: _loginBloc.changePassword,
        keyboardType: TextInputType.text,
        // controller: emailController,
        decoration: InputDecoration(
            // errorText: snapshot.hasError ? snapshot.error : null,
            suffixIcon: IconButton(
                icon: Icon(
                    obcurecerSenha ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  print("obscurecerSenha $obcurecerSenha");
                  setState(() {
                    obcurecerSenha = !obcurecerSenha;
                  });
                })),
      ),
    );
  }

  Widget _buttonReturn() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
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
          // setState(() {
          //   cardMostrar;
          // });
        },
        icon: Icon(Icons.arrow_back),
        label: Text("Retornar a tela anterior"),
      ),
    );
  }

  // Widget _buttonSave() {
  //   return Padding(
  //     padding:
  //         const EdgeInsets.only(left: 8.0, top: 0.0, right: 8.0, bottom: 0.0),
  //     child: ElevatedButton.icon(
  //       style: ElevatedButton.styleFrom(
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
  //         dialogoInformativo(context,
  //             "Desculpe o transtorno, esta rotina encontra-se em desenvolvimento.");
  //       },
  //       icon: Icon(Icons.save_alt),
  //       label: Text("Guardar informações"),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Center(
      key: UniqueKey(),
      child: Card(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _fieldName(),
              _fieldEmail(),
              _fieldPassword1(),
              _fieldPassword2(),
              _buttonReturn(),

              // loginButon,
            ],
          ),
        ),
      ),
    );
  }
}
