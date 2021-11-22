import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size_config.dart';

class Social extends StatelessWidget {
  const Social({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocalCard(
          icon: "assets/icons/google-icon.svg",
          press: () {},
        ),
        SocalCard(
          icon: "assets/icons/facebook-2.svg",
          press: () {},
        ),
        SocalCard(
          icon: "assets/icons/twitter.svg",
          press: () {},
        ),
         SocalCard(
          icon: "assets/icons/Apple_logo_black.svg",
          press: () {},
        ),
      ],
    );
  }
}

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(9),
        height: 40,
        width: 40,
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
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
