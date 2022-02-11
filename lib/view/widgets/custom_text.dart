import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {this.title = '', this.color = Colors.black, this.fontSize = 16.0,this.alignment=Alignment.topLeft, this.maxLine,this.height=1});

  final String title;
  final Color color;
  final double fontSize;
  final Alignment alignment;
  final int? maxLine;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
        child: Text(
      title,
      style: TextStyle(
          height: height,
          color: color,
          fontSize: fontSize),
          maxLines: maxLine,
    ));
  }
}
