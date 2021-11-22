import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Widgets/WaveClipper.dart';
import 'package:flutter_app/Widgets/intro.dart';
import 'package:flutter_app/Widgets/signup_form.dart';
import 'package:flutter_app/constants.dart';
import '../../size_config.dart';

class SignUpScreen extends StatelessWidget {
static String routeName ="/sign_up";

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   "Sign Up",
        //   style: TextStyle(color: Colors.white),
        //   ),
        backgroundColor:kPrimaryColor ,
        iconTheme: IconThemeData(color: Colors.white),

      ),
      body: SafeArea(
          child: SingleChildScrollView(
          scrollDirection: Axis.vertical ,
          child: Center(
            child: Stack(
                children: [
                  waveClipper2(),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children:[
                    SizedBox(height: getProportionateScreenWidth(90)),
                    ScreenTitle(text: "Create New Account",),
                    SizedBox(height: getProportionateScreenWidth(10)),
                    BodyText(text:"Complete your details or continue \n with social media"),
                    SizedBox(height: getProportionateScreenWidth(30)),
                    SignUpForm(),
                  ],
                ),
              ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}

