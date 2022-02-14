// ignore_for_file: use_key_in_widget_constructors

import 'package:b_store/core/viewmodel/profile_view_model.dart';
import 'package:b_store/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder:(controller)=> Scaffold(
        body: Center(
          child: Container(
            child: TextButton(
              onPressed: (){
                  controller.signOut();
                  Get.offAll(LoginScreen());
              },
              child: Text('Sign Out'),
            ),
          ),
        )
      ),
    );
  }
}
