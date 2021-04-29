import 'package:cloud_firestore/cloud_firestore.dart';

final usuarioCaminho = FirebaseFirestore.instance
    .collection("condominio")
    .doc('administracao')
    .collection('usuarios');