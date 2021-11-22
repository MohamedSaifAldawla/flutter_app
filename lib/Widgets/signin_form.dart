import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/SuffixIcon.dart';
import 'package:flutter_app/Widgets/default_button.dart';
import 'package:flutter_app/Widgets/form_error.dart';
import 'package:flutter_app/Widgets/intro.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];
  

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField("Email","Enter your email","email","assets/icons/Mail.svg"),
          SizedBox(height: getProportionateScreenWidth(25)),
          buildPasswordFormField("Password","Enter your password","password","assets/icons/Lock.svg"),
          SizedBox(height: getProportionateScreenWidth(10)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              BodyText(text:"Remember me",),
              Spacer(),
              GestureDetector(
                onTap: () {
                //Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                child: BodyText(text:"Forgot Password",color: kPrimaryColor,),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenWidth(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                // KeyboardUtil.hideKeyboard(context);
                // Navigator.pushNamed(context, SignUpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
  
  Container buildEmailFormField(String label,String hint,String type, String icon) {
    return Container(
        decoration: BoxDecoration(
        boxShadow: [
        BoxShadow(
        color: Color.fromRGBO(146, 147, 141, .2),
        //spreadRadius: 5,
        blurRadius: 20.0,
        offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TextFormField(   
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value)) {
            addError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: SuffixIcon(inputIcon:icon),
          fillColor: Colors.white,
          filled: true,
        ),
        style: TextStyle(fontSize: getProportionateScreenWidth(15)),
      ),
    );
  }

  Container buildPasswordFormField(String label,String hint,String type, String icon) {
    return Container(
        decoration: BoxDecoration(
        boxShadow: [
        BoxShadow(
        color: Color.fromRGBO(146, 147, 141, .2),
        blurRadius: 20.0,
        offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          suffixIcon: SuffixIcon(inputIcon:icon),
          fillColor: Colors.white,
          filled: true,
        ),
        style: TextStyle(fontSize: getProportionateScreenWidth(15)),
      ),
    );
  }

}
