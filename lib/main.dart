import 'package:flutter/material.dart';
import 'package:flutter_app/theme.dart';
import 'package:flutter_app/theme_dark.dart';
import 'package:flutter_app/views/sign_in/sign_in.dart';
import 'package:get/get.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme:theme(),
      themeMode: ThemeMode.system,
      darkTheme: theme2(),
      home: SignInScreen(),
    );
  }
}

