import 'dart:async';
import 'package:email_validator/email_validator.dart';

class LoginValidator {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    final bool isValid = EmailValidator.validate(email);
    if (isValid) {
      return null;
    } else {
      return "Email inválido";
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(handleData: (password, sink) {
    if (!password.trim().isEmpty || password != null) {
      return null;
    } else {
      return "Senha inválida";
      ;
    }
  });


}