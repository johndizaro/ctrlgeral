import 'package:flutter/material.dart';

abstract class SigninEvent {}

class SigninUsernameChanged extends SigninEvent {
  final String username;

  SigninUsernameChanged({this.username});
}

class SigninPasswordChanged extends SigninEvent {
  final String password;

  SigninPasswordChanged({this.password});
}

class SigninSubmitted extends SigninEvent {
}
