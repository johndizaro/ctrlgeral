
import 'package:flutter/material.dart';

class CircularProgressText extends StatelessWidget {
  final String message;

  const CircularProgressText({Key key, @required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10.0),
        child: Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  Opacity(
                    opacity: .5,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                    ),
                  ),
                  Text(message),
                ],
              );
            }
        ),
      ),
    );
  }
}
