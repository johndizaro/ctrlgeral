
import 'package:ctrl_geral/logging/logger_style.dart';
import 'package:ctrl_geral/routes/screen_routes.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({Key key, @required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(title);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState(String nomeEmpresa);

  Logger logger = Logger(
    printer: LoggerStyle('HomeScreen'),
  );



  @override
  Widget build(BuildContext context) {
    logger.i("iniciou");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: TextButton(onPressed: (){
            // _loginBloc.signout();
            Navigator.pushNamed(context, Routes.routeLoginScreen);
          }, child: Text("voltar a tela de signin")),
        ),
      ),
      drawer: Drawer(child: ListView(
        children: [
          DrawerHeader(
            child: RichText(
              text: TextSpan(
                  children: <TextSpan>[
              TextSpan(text: "Bom dia, "),
              TextSpan(text:  " John " ),
              TextSpan(text: "vamos trabalhar?")
                  ]
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // final _loginBloc = LoginBloc();
              // _loginBloc.signout();
            },
          ),
        ],

      ),),
    );
  }
}

// class Core extends GetWidget<AuthController> {
//   @override
//   Widget build(BuildContext context) {
//     return GetX(
//       initState: (_) async {
//         // Get.put<UserController>(UserController());
//         // Get.put<UserController>(UserController());
//         Get.lazyPut(() =>UserController());
//       },
//       builder: (_){
//         if (Get.find<UserController>().user?.id != null){
//           return Home();
//         } else {
//           return Login();
//         }
//       },
//     );
//   }
// }
