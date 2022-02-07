import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {this.title = '', this.color = Colors.black, this.fontSize = 16.0,this.alignment=Alignment.topLeft});

  final String title;
  final Color color;
  final double fontSize;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
        child: Text(
      title,
      style: TextStyle(color: color, fontSize: fontSize),
    ));
  }
}
