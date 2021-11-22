import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/SuffixIcon.dart';
import 'package:flutter_app/Widgets/default_button.dart';
import 'package:flutter_app/Widgets/form_error.dart';
import 'package:flutter_app/constants.dart';
import 'package:flutter_app/size_config.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField("Password","Enter your password","password","assets/icons/Lock.svg"),
          SizedBox(height: getProportionateScreenHeight(10)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Create account",
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

  
  TextFormField buildEmailFormField(String label,String hint,String type, String icon) {
    return TextFormField(   
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
      ),
      style: TextStyle(fontSize: getProportionateScreenWidth(15)),
    );
  }

  TextFormField buildPasswordFormField(String label,String hint,String type, String icon) {
    return TextFormField(
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
      ),
      style: TextStyle(fontSize: getProportionateScreenWidth(15)),
    );
  }

}






































// class SignForm extends StatefulWidget {
//   @override
//   _SignFormState createState() => _SignFormState();
// }

// class _SignFormState extends State<SignForm> {

//   final _formKey = GlobalKey<FormState>();
//   final List<String> errors=["Demo Error and fuv"];

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           SizedBox(height: getProportionateScreenWidth(40)),
//            InputField(
//             lable: "Email",
//             hint:  "Enter Your Email",
//             type: "email",
//             inputIcon:(Icons.mail_outline_sharp),
//             validate:"email" ,
//             ),
//             SizedBox(height: getProportionateScreenWidth(30)),
//            InputField(
//             lable: "Password",
//             hint:  "Enter Your Password",
//             type: "Password",
//             inputIcon: (Icons.lock_outline),
//             validate:"Password" ,
//             ),
//             SizedBox(height: getProportionateScreenWidth(20)),
//             FormError(errors: errors),
//             DefaultButton(
//               text: "Continue",
//               press: () {
//                 if(_formKey.currentState.validate()){
//                   _formKey.currentState.save();
//                 }
//               },
//             ),
//         ],
//       ),
//     );
//   }
// }



// class InputField extends StatefulWidget {
//   const InputField({
//     key, 
//     @required this.lable, 
//     @required this.hint, 
//     @required this.type, 
//     @required this.inputIcon,
//     @required this.validate,
//   }) : super(key: key);

// final String lable , hint, type, validate;
// final IconData inputIcon;

//   @override
//   State<InputField> createState() => _InputFieldState();
// }

// class _InputFieldState extends State<InputField> {

//   @override
//   Widget build(BuildContext context) {
//         return TextFormField(
//           obscureText: widget.type=="Password" ? true : false,
//           keyboardType: widget.type=="email" ? TextInputType.emailAddress : TextInputType.text,
//           validator: (value){
//             if (value.isEmpty){
//               setState((){
//               });
//             }
//             return null;
//           },
//           decoration: InputDecoration(
//             labelText: widget.lable,
//             hintText:widget.hint,
//             suffixIcon:SuffixIcon(inputIcon: widget.inputIcon)
//        ),
//       );
//   }
// }
