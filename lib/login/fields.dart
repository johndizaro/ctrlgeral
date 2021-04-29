import 'package:flutter/cupertino.dart';

class LoginFields {
  static const String _label = "label";
  static const String _size = "size";

//  static const String _dbname = "dbname";
  static const String _hint = "hint";

  static const String col00Nome = "nome";
  static const String col00Email = "email";
  static const String col00Senha = "senha";
  static const String col00URLPhoto = "urlphoto";

  Map<String, dynamic> _fieldsMap = {
    col00Nome: {_label: "Nome do usuario", _size: 50, _hint: "Seu Nome"},
    col00Email: {_label: "Email", _size: 50, _hint: "ex: meuemail@gmail.com"},
    col00Senha: {_label: "Senha", _size: 10, _hint: "ex: 123AAaBBb"},
    col00URLPhoto: {_label: "Url Photo", _size: Null, _hint: "sua foto"},
  };

  Map fieldMap(String fieldName) {
    return _fieldsMap[fieldName];
  }

  String label(String fieldName) {
    return _fieldsMap[fieldName][_label];
  }

  int size(String fieldName) {
    return _fieldsMap[fieldName][_size];
  }

  String hint(String fieldName) {
    return _fieldsMap[fieldName][_hint];
  }
}
