 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:velocity_x/velocity_x.dart";
class Themes{

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    backgroundColor: blueishColor,
    // primarySwatch: Colors.grey,
    fontFamily: GoogleFonts.lato().fontFamily,
    primaryTextTheme: GoogleFonts.latoTextTheme(),
    canvasColor: creamColor,
    cardColor: creamColor,
    primaryColor: blueishColor,
    accentColor: Colors.black,
    textSelectionColor: blueishColor,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        systemOverlayStyle:  Theme.of(context).platform == TargetPlatform.iOS ? SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light) : SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark)
    )
  );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
    backgroundColor: Colors.lightGreenAccent,
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    canvasColor: darkGreyColor,
    cardColor: Vx.gray800,
    accentColor: Colors.white,
    fontFamily: GoogleFonts.lato().fontFamily,
    primaryTextTheme: GoogleFonts.latoTextTheme(),
    primaryColor: Colors.white,
    appBarTheme: AppBarTheme(
        systemOverlayStyle:  Theme.of(context).platform == TargetPlatform.iOS ? SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark) : SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light)
    )

  );
  static Color creamColor = Vx.red50;
  // static Color creamColor = Color(0xfff5f5f5);
  static Color lightColor = Color(0xffdff9fb);
  // static Color blueishColor = Color(0xff403b58);

  static Color blueishColor = Vx.red900;
  static Color lightGreenColor = Color(0xff81e3ab);
  // static Color darkGreyColor = Vx.gray800;
  static Color darkGreyColor = Color(0xff121212);
  static Color lightBlueColor = Vx.lightBlue600;
 }