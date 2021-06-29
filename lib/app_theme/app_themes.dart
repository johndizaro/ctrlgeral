import 'package:flutter/material.dart';

//Theme.of(context).copyWith(accentColor: Colors.yellow),

class AppThemes {
  static MaterialColor primarySwatch = Colors.teal;
  static Color primaryLightColor = Colors.tealAccent;
  static Color primaryDarkColor = Colors.teal.shade900;

  static Color secondaryColor = Color(0xff00bfa5);
  static Color secondaryLightColor = Color(0xff5df2d6);
  static Color secondaryDarkColor = Color(0xff008e76);

//  static Color primaryTextColor = Colors.white;
//  static Color secundaryTextColor = Colors.black;

  static Brightness brightness = Brightness.light;
  static Color errorColor = Colors.redAccent;
  static Color dissabledColor = Colors.grey.shade400;
  static Color shadowColor = Colors.teal;

  static OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(width: 1),
  );

  static OutlineInputBorder _enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(width: 1, color: primarySwatch),
  );

  static OutlineInputBorder _errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(width: 1, color: errorColor),
  );

  static OutlineInputBorder _disabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
//    borderSide: BorderSide(width: 1, color: Colors.grey.shade400),
    borderSide: BorderSide(width: 1),
  );

  static ShapeBorder shapeBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  final ThemeData myAppTheme = ThemeData(
      brightness: brightness,
      primarySwatch: primarySwatch,
      appBarTheme: AppBarTheme(color: primarySwatch),
      scaffoldBackgroundColor: primaryLightColor,
      accentColor: Colors.blue.shade100,
      disabledColor: dissabledColor,
      buttonTheme: ButtonThemeData(
        height: 30,
        shape: shapeBorder,
        buttonColor: primarySwatch,
        colorScheme: ColorScheme.fromSwatch(cardColor: primarySwatch),
        disabledColor: dissabledColor,
      ),
      backgroundColor: primarySwatch,
      iconTheme: IconThemeData(color: primarySwatch, size: 30),
      cardTheme: CardTheme(
        shadowColor: shadowColor,
        margin: EdgeInsets.all(8),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 2,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        disabledElevation: 0,
        elevation: 20,
        shape: shapeBorder,
        splashColor: Colors.red.withOpacity(0.25),
        backgroundColor: primarySwatch,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: _outlineInputBorder,
        errorBorder: _errorBorder,
        enabledBorder: _enabledBorder,
        disabledBorder: _disabledBorder,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primarySwatch,
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
        headline2: TextStyle(
            fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        headline3: TextStyle(
            fontSize: 48, fontWeight: FontWeight.w400, letterSpacing: 0.0),
        headline4: TextStyle(
            fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        headline5: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.0),
        headline6: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        subtitle1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w300, letterSpacing: 0.15),
        subtitle2: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.1),
        bodyText1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        bodyText2: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      ),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ));
}
