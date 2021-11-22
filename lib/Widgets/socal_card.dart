import 'package:flutter/material.dart';
import 'package:flutter_app/constants.dart';

import '../size_config.dart';

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final IconData icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
            color: Color.fromRGBO(0, 46, 51, .2),
            blurRadius:10,
            offset: Offset(0, 10),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: kSecondaryColor,
          ),
      ),
    );
  }
}
