import 'package:b_store/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomIconTextButton extends StatelessWidget {
  CustomIconTextButton({this.onpressed, this.imagePath = '', this.text = ''});

  final void Function()? onpressed;
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100,),
      child: TextButton(
        onPressed: onpressed,
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Row(
          children: [
            Image.asset(imagePath),
            const SizedBox(width: 80),
            CustomText(title: text)
          ],
        ),
      ),
    );
  }
}
