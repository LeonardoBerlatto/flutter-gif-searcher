import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        brightness: Brightness.dark,
        color: Colors.black,
      ),
      primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white, fontSize: 22.0),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0))),
      hintColor: Colors.white);
}
