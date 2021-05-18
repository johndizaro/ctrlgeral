import 'package:ctrl_geral/app_theme/app_themes.dart';
import 'package:flutter/material.dart';


Future<void> dialogoCircularProgress(BuildContext context, String mensagem) async {

  return   showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new CircularProgressIndicator(),
            ),
            new Text(mensagem),
          ],
        ),
      );
    },
  );

}