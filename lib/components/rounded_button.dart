import 'package:flutter/material.dart';
import 'package:order/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = buttonColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            color: color,
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: textColor),
            )),
      ),
    );
  }
}