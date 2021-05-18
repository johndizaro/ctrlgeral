import 'dart:async';
import 'package:email_validator/email_validator.dart';

class LoginValidator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    final bool isValid = EmailValidator.validate(email);

    if (isValid) {
      return "Email inválido1";
    } else {
      return "Email inválido2";
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.trim().isNotEmpty ) {
      return "senha invalida1";
    } else {
      return "Senha inválida2";

    }
  });
}
