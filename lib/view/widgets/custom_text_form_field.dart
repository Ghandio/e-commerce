// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'custom_text.dart';
class CustomTextFormField extends StatelessWidget {

  CustomTextFormField({this.text='',this.hint='',this.onSave,this.validator});
  final String text;
  final String hint;
  final void Function(String?)? onSave;
  final FormFieldValidator<String>? validator;



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(title: text,fontSize: 14,color: Colors.grey.shade900,),
          TextFormField(
            onSaved: onSave,
            validator: validator,
            decoration:  InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.green
            ),
          ),
        ],
      ),
    );
  }
}
