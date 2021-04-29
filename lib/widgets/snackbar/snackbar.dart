import 'package:flutter/material.dart';

Future<void> snackbar(BuildContext context, String mensagem){
  SnackBar(
    content: const Text('Aguarde um instante por favor!'),
    action: SnackBarAction(
      label: 'Entendido',
      onPressed: () {},
    ),
  );

}