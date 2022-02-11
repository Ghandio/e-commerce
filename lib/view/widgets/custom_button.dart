import 'package:b_store/const.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final void Function()? onpressed;

  CustomButton({this.title = '', this.color = kPrimarycolor, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
        child: Text(title),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: color,
          padding: const EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18)
          )
        ),
    );
  }
}
