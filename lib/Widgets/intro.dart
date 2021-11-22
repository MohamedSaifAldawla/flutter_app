import 'package:flutter/material.dart';

import '../size_config.dart';


class BodyText extends StatelessWidget {
  const BodyText({
    Key key, 
    @required this.text,
    this.color,
    this.weight,

  }) : super(key: key);

    final String text , weight ;
    final color;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
    color: color!=null ? color : null,
    fontSize: getProportionateScreenWidth(14),
    fontWeight: weight!=null? FontWeight.bold : FontWeight.normal,
    );
    
    return Text(text,
    textAlign: TextAlign.center,
    style: textStyle,
    );

  }
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    Key key, 

   @required this.text,
    this.color,
  }) : super(key: key);

    final String text ;
    final color;

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
    color: color!=null ? color : null,
    fontSize: getProportionateScreenWidth(28),
    fontWeight: FontWeight.bold,
    height: 1.5,
    );
    return Text(text,
    style: textStyle,
    );
  }
}