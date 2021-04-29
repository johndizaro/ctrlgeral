//
// import 'package:ctrl_condominio/route/caminhos.dart';
// import 'package:flutter/material.dart';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:scoped_model/scoped_model.dart';
//
// class UsuarioModel extends Model {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseUser firebaseUser;
//
//   Map<String, dynamic> usuarioData = Map();
//   bool isLoading = false;
//
//   static UsuarioModel of(BuildContext context) =>
//       ScopedModel.of<UsuarioModel>(context);
//
//   @override
//   void addListener(VoidCallback listener) {
//     super.addListener(listener);
//
//     _loadCurrentUser();
//   }
//
//   void signUp(
//       {@required Map<String, dynamic> usuarioData,
//       @required String senha,
//       @required VoidCallback onSuccess,
//       @required VoidCallback onFail}) {
//     isLoading = true;
//     notifyListeners();
//
//     _auth
//         .createUserWithEmailAndPassword(
//             email: usuarioData['email'], password: senha)
//         .then((usuario) async {
//       firebaseUser = usuario.user;
//       _salvarUsuarioData(usuarioData);
//       onSuccess();
//       isLoading = false;
//
//       notifyListeners();
//     }).catchError((onError) {
//       onFail();
//       isLoading = false;
//       notifyListeners();
//     });
//   }
//
//   void signIn(
//       {@required String email,
//       @required String pass,
//       @required VoidCallback onSuccess,
//       @required VoidCallback onFail}) async {
//     isLoading = true;
//     notifyListeners();
//
//     _auth
//         .signInWithEmailAndPassword(email: email, password: pass)
//         .then((usuario) async {
//       firebaseUser = usuario.user;
//
//       await _loadCurrentUser();
//       onSuccess();
//       isLoading = false;
//       notifyListeners();
//     }).catchError((e) {
//       print("jed_ERRO: $e");
//       onFail();
//       isLoading = false;
//       notifyListeners();
//     });
//   }
//
//   void singOut() async {
//     await _auth.signOut();
//     usuarioData = Map();
//     firebaseUser = null;
//     notifyListeners();
//   }
//
//   void recoverPass(String email) {
//     _auth.sendPasswordResetEmail(email: email);
//   }
//
//   bool isLoggedIn() {
//     return firebaseUser != null;
//   }
//
//   Future<Null> _salvarUsuarioData(Map<String, dynamic> usuarioData) async {
//     this.usuarioData = usuarioData;
//     await usuarioCaminho.document(firebaseUser.uid).setData(this.usuarioData);
//   }
//
//   Future<Null> _loadCurrentUser() async {
//     if (firebaseUser == null) firebaseUser = await _auth.currentUser();
//     if (firebaseUser != null) {
//       if (usuarioData["name"] == null) {
//         DocumentSnapshot docUser =
//             await usuarioCaminho.document(firebaseUser.uid).get();
//         usuarioData = docUser.data;
//       }
//     }
//     notifyListeners();
//   }
// }
