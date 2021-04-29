import 'package:ctrl_geral/app_theme/app_themes.dart';
import 'package:flutter/material.dart';


Future<void> dialogoErro(BuildContext context, String mensagem) async {
  return showDialog<void>(
    context: context ,
    barrierDismissible: false, // user must tap button!
    barrierColor: AppThemes.primarySwatch.withOpacity(.7),
    builder: (BuildContext context) {
      return AlertDialog(elevation: 10,
        title: Icon(Icons.error_outline,size: 60,color: Colors.red,),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(mensagem,maxLines: 3,textAlign: TextAlign.justify,),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Entendido'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}