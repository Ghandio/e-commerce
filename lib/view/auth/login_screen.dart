// ignore_for_file: prefer_const_constructors
import 'package:b_store/const.dart';
import 'package:b_store/core/viewmodel/auth_view_model.dart';
import 'package:b_store/view/auth/register_view.dart';
import 'package:b_store/view/widgets/custom_button.dart';
import 'package:b_store/view/widgets/custom_icon_text_button.dart';
import 'package:b_store/view/widgets/custom_text.dart';
import 'package:b_store/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  CustomText(title: "Welcome,",fontSize: 30.0,),
                  GestureDetector(child: CustomText(title: "Sign Up",fontSize: 18,color: kPrimarycolor,),
                  onTap: (){
                    Get.to(RegisterScreen());
                  },)]

              ),
              const SizedBox(height: 10,),
              CustomText(title: 'Sign in to Continue',fontSize: 14.0,color: Colors.grey,),
              const SizedBox(height: 30,),
              CustomTextFormField(
                  text:'Email',
                  hint:'iamdavid@gmail.com',
                  onSave:(value){
                        controller.email=value!;
              }, validator:(value){
                  if(value==null){
                    print("ERROR");
                  }
              }),
              SizedBox(height: 40,),
              CustomTextFormField(text:'Password' ,
                  hint: '*******',
                  onSave:(value){
                      controller.password=value!;
                  },
                  validator:(value){
                    if(value==null){
                      print("ERROR password");
                    }
                  }),
              const SizedBox(height: 30,),
              CustomText(title: 'Forget Password?',alignment: Alignment.topRight,),
              SizedBox(height: 10,),
              CustomButton(title: 'SIGN IN',onpressed: (){
                                 _formKey.currentState?.save();
                            if(_formKey.currentState!.validate()){
                              controller.emailAndPasswordSignIn();
                            }

              },),
              SizedBox(height: 20,),
              CustomText(title: '-OR-',alignment: Alignment.center,),
              SizedBox(height: 30,),
              CustomIconTextButton(
                imagePath:'assets/images/facebook.png',
                text: 'Sign In with Facebook',
                onpressed: (){
                    controller.facebookSignIn();
              },),
              SizedBox(height: 20,),
              CustomIconTextButton(
                imagePath: 'assets/images/google.png',
                text: 'Sign In with Google',
                onpressed: (){
                          controller.googleSignInMethod();
              },)





            ],
          ),
        ),
      ),
    );
  }
}
