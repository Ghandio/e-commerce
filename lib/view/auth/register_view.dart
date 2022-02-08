// ignore_for_file: prefer_const_constructors
import 'package:b_store/const.dart';
import 'package:b_store/core/viewmodel/auth_view_model.dart';
import 'package:b_store/view/auth/login_screen.dart';
import 'package:b_store/view/widgets/custom_button.dart';
import 'package:b_store/view/widgets/custom_icon_text_button.dart';
import 'package:b_store/view/widgets/custom_text.dart';
import 'package:b_store/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back,color:Colors.black),onTap: (){
          Get.off(LoginScreen());
        },) ,
        toolbarHeight: 50,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomText(
                  title: "Sign Up,",
                  fontSize: 30.0,
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                  text: 'Name',
                  hint: 'David Spade',
                  onSave: (value) {
                    controller.name=value!;

                  },
                  validator: (value) {
                    if(value==null){
                      print("Error");
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                  text: 'Email',
                  hint: 'iamdavid@gmail.com',
                  onSave: (value) {
                    controller.email=value!;
                  },
                  validator: (value) {
                    if(value==null){
                      print("Error");
                    }
                  }),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                  text: 'Password',
                  hint: '*******',
                  onSave: (value) {
                    controller.password=value!;
                  },
                  validator: (value) {
                    if(value==null){
                      print("Error");
                    }
                  }),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                title: 'SIGN UP',
                onpressed: () {
                    _formKey.currentState?.save();
                    if(_formKey.currentState!.validate()){
                      controller.SignUpWithEmailAndPassword();
                    }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
