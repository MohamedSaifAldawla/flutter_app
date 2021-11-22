import 'package:flutter/widgets.dart';
import 'package:flutter_app/views/sign_in/sign_in.dart';
import 'package:flutter_app/views/sign_up/sign_up.dart';



// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
SignInScreen.routeName:(context) => SignInScreen(),
SignUpScreen.routeName:(context) => SignUpScreen(),
};
