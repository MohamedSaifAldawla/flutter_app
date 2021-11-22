import 'package:flutter/material.dart';

import 'constants.dart';
  ThemeData theme2() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      fontFamily: "Muli",
      brightness: Brightness.dark,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: InputTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

AppBarTheme appBarTheme() {
    return const AppBarTheme(
        backgroundColor:Colors.white ,
        foregroundColor: Color(0XFF8B8B8B),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      );
  }

   TextTheme textTheme() {
    return const TextTheme(
        headline6: TextStyle(fontSize: 18),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color:Colors.white),
      );
  }
  
  InputDecorationTheme InputTheme() {
    return InputDecorationTheme(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 20,
              ),
            enabledBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10,
            ),
            focusedBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(28),
            borderSide: const BorderSide(color: kTextColor),
            gapPadding: 10,
            ),
            focusedErrorBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(28),
            borderSide: const BorderSide(color: Colors.red),
            gapPadding: 10,
            ),
            errorBorder: OutlineInputBorder(
            borderRadius:BorderRadius.circular(28),
            borderSide: const BorderSide(color: Colors.red),
            gapPadding: 10,
            ),
            
          );
  }
  