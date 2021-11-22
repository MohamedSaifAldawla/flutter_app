import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Widgets/no_account_text.dart';
import 'package:flutter_app/Widgets/signin_form.dart';
import 'package:flutter_app/Widgets/WaveClipper.dart';
import 'package:flutter_app/Widgets/intro.dart';
import 'package:flutter_app/Widgets/socal_card.dart';
import 'package:flutter_app/constants.dart';
import '../../size_config.dart';

class SignInScreen extends StatelessWidget {
//static String routeName ="/sign_in";

  @override
  Widget build(BuildContext context) {
     SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:kPrimaryColor ,
      ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical ,
          child: SafeArea( 
                child: Center(
                  child: Stack(
                    children: [
                    waveClipper(),
                    Padding(
                        padding:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                        child: Column(
                        children:[
                          //SizedBox(height: getProportionateScreenWidth(50)),
                          // Icon(
                          //   Icons.login_rounded,
                          //   size: 80,
                          //   color: Colors.white,
                          //   ),
                          SizedBox(height: getProportionateScreenWidth(110)),
                          ScreenTitle(text: "Sign In",),
                          SizedBox(height: getProportionateScreenWidth(5)),
                          BodyText(text:"Sign in with your email and password  \nor continue with social media",),
                          SizedBox(height: getProportionateScreenWidth(30)),
                          SignForm(),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          Social(),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          NoAccountText(),
                          SizedBox(height: getProportionateScreenWidth(10)),
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



