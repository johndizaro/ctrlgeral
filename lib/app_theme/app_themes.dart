import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

//Theme.of(context).copyWith(accentColor: Colors.yellow),

class AppThemes {
  static Color primarySwatch = Colors.blue;
  static Color acentColor = Colors.blueAccent;

  static Color primaryColor = Colors.cyan[900];
  static Color primaryLightColor = Colors.cyan[200];
  static Color primaryDarkColor = Colors.cyan[600];

  static Color secondaryColor = Colors.green[900];
  static Color secondaryLightColor = Colors.green[200];
  static Color secondaryDarkColor = Colors.green[700];

//  static Color primaryTextColor = Colors.white;
//  static Color secundaryTextColor = Colors.black;

  static Brightness brightness = Brightness.light;
  static Color errorColor = Colors.redAccent;
  static Color dissabledColor = Colors.grey.shade400;
  static Color shadowColor = Colors.blueAccent;

//  static Radius  radiusCircular = Radius.circular(20);
//  static BorderRadius  borderRadiusCircular = BorderRadius.circular(20);

//   static Decoration _boxDecoration = BoxDecoration(
//     borderRadius: BorderRadius.all(
//       Radius.circular(20),
//     ),
// //    color: Colors.blue.shade200,
//   );

  static OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
      width: 1,
      color: primarySwatch,
    ),
  );

  // static OutlineInputBorder _enabledBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(20),
  //   borderSide: BorderSide(
  //     width: 2,
  //     color: primarySwatch,
  //   ),
  // );

  static OutlineInputBorder _errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(
      width: 1,
      color: errorColor,
    ),
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

//   final BorderRadius inputBorder = BorderRadius.vertical(
//      bottom: Radius.circular(10.0),
//      top: Radius.circular(20.0),
//    );

  final ThemeData myAppTheme = ThemeData(
      brightness: brightness,
      primarySwatch: primarySwatch,
//      primaryColor:  primaryDarkColor,

      appBarTheme: AppBarTheme(
        color: primarySwatch,
      ),
      scaffoldBackgroundColor: primaryLightColor,
//    primaryIconTheme: IconThemeData(color: primarySwatch) ,
      accentColor: Colors.blue.shade100,
      disabledColor: dissabledColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shadowColor: shadowColor,
          // padding: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
      buttonTheme: ButtonThemeData(
        alignedDropdown: true,
        // height: 30,
        shape: shapeBorder,
        buttonColor: primarySwatch,
//        textTheme: TextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          cardColor: primarySwatch,
        ),
        disabledColor: dissabledColor,

//        colorScheme: ColorScheme(
//          primary: primarySwatch,
//          onPrimary: Colors.white,
//          primaryVariant: primarySwatch.withOpacity(.5),
//          background: Colors.red,
//          onBackground: Colors.black,
//          secondary: Colors.white,
//          onSecondary: primarySwatch,
//          secondaryVariant: Colors.deepOrange,
//          error: Colors.black,
//          onError: Colors.white,
//          surface: Colors.white,
//          onSurface: Colors.black,
//          brightness: Brightness.light,
//        ),
      ),
      backgroundColor: primarySwatch,
      iconTheme: IconThemeData(
        color: primarySwatch,
        size: 30,
      ),
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

      // pageTransitionsTheme: PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
      //   TargetPlatform.android: ZoomPageTransitionsBuilder()
      // } ),

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
        // border: _outlineInputBorder,
        border: _outlineInputBorder,
        errorBorder: _errorBorder,
        enabledBorder: _outlineInputBorder,
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

      // textTheme: TextTheme(
      //   headline1: GoogleFonts.roboto(
      //       fontSize: 96,
      //       fontWeight: FontWeight.w300,
      //       letterSpacing: -1.5
      //   ),
      //   headline2: GoogleFonts.roboto(
      //       fontSize: 60,
      //       fontWeight: FontWeight.w300,
      //       letterSpacing: -0.5
      //   ),
      //   headline3: GoogleFonts.roboto(
      //       fontSize: 48,
      //       fontWeight: FontWeight.w400
      //   ),
      //   headline4: GoogleFonts.roboto(
      //       fontSize: 34,
      //       fontWeight: FontWeight.w400,
      //       letterSpacing: 0.25
      //   ),
      //   headline5: GoogleFonts.roboto(
      //       fontSize: 24,
      //       fontWeight: FontWeight.w400
      //   ),
      //   headline6: GoogleFonts.roboto(
      //       fontSize: 20,
      //       fontWeight: FontWeight.w500,
      //       letterSpacing: 0.15
      //   ),
      //   subtitle1: GoogleFonts.roboto(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w400,
      //       letterSpacing: 0.15
      //   ),
      //   subtitle2: GoogleFonts.roboto(
      //       fontSize: 14,
      //       fontWeight: FontWeight.w500,
      //       letterSpacing: 0.1
      //   ),
      //   bodyText1: GoogleFonts.roboto(
      //       fontSize: 16,
      //       fontWeight: FontWeight.w400,
      //       letterSpacing: 0.5
      //   ),
      //   bodyText2: GoogleFonts.roboto(
      //       fontSize: 14,
      //       fontWeight: FontWeight.w400,
      //       letterSpacing: 0.25
      //   ),
      //   button: GoogleFonts.roboto(
      //       fontSize: 14,
      //       fontWeight: FontWeight.w500,
      //       letterSpacing: 1.25
      //   ),
      //   caption: GoogleFonts.roboto(
      //       fontSize: 12,
      //       fontWeight: FontWeight.w400,
      //       letterSpacing: 0.4
      //   ),
      //   overline: GoogleFonts.roboto(
      //       fontSize: 10,
      //       fontWeight: FontWeight.w400,
      //       letterSpacing: 1.5
      //   ),
      // ),
      popupMenuTheme: PopupMenuThemeData(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      )

//    inputTheme: InputDecorationTheme(
//      filled: true,
//      fillColor: Colors.purple.withOpacity(.1),
//      contentPadding: EdgeInsets.zero,
//      errorStyle: TextStyle(
//        backgroundColor: Colors.orange,
//        color: Colors.white,
//      ),
//      labelStyle: TextStyle(fontSize: 12),
//      enabledBorder: UnderlineInputBorder(
//        borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
//        borderRadius: inputBorder,
//      ),
//      focusedBorder: UnderlineInputBorder(
//        borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
//        borderRadius: inputBorder,
//      ),
//      errorBorder: UnderlineInputBorder(
//        borderSide: BorderSide(color: Colors.red.shade700, width: 7),
//        borderRadius: inputBorder,
//      ),
//      focusedErrorBorder: UnderlineInputBorder(
//        borderSide: BorderSide(color: Colors.red.shade400, width: 8),
//        borderRadius: inputBorder,
//      ),
//      disabledBorder: UnderlineInputBorder(
//        borderSide: BorderSide(color: Colors.grey, width: 5),
//        borderRadius: inputBorder,
//      ),
//    ),

//    inputDecorationTheme: InputDecorationTheme(
//      border: inputBorder,
//      filled: true,
//      alignLabelWithHint: true,
//      errorBorder: inputBorder.copyWith(
//          borderSide: BorderSide(color: Colors.red.withOpacity(500),
//          ),
//      ),

//Theme.of(context).accentColor,
////      errorBorder: OutlineInputBorder(
////        borderSide: BorderSide(color: Colors.red, width: 2.0),
////        borderRadius: BorderRadius.circular(20),
//      alignLabelWithHint: false,
//      contentPadding: EdgeInsets.zero,

//      focusedErrorBorder: OutlineInputBorder(
//        borderSide: BorderSide(color: Colors.red, width: 2.0),
//        borderRadius: BorderRadius.circular(20),
//      ),

//      focusedBorder: OutlineInputBorder(
//        borderSide: BorderSide(width: 3.0),
//        borderRadius: BorderRadius.circular(8),
//      ),

//      enabledBorder: OutlineInputBorder(
//        borderSide: BorderSide(color: Colors.blue.shade300, width: 2.0),
//        borderRadius: BorderRadius.circular(20),
//      ),
//      errorBorder: OutlineInputBorder(
//        borderSide: BorderSide(color: Colors.red, width: 2.0),
//        borderRadius: BorderRadius.circular(20),
//      ),
      );
}
