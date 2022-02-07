
// ignore_for_file: use_key_in_widget_constructors

import 'package:b_store/core/viewmodel/auth_view_model.dart';
import 'package:b_store/view/auth/login_screen.dart';
import 'package:b_store/view/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ControlView extends GetWidget<AuthViewModel> {


  @override
  Widget build(BuildContext context) {
    return Obx((){
      return(Get.find<AuthViewModel>().user!=null)?HomeScreen():LoginScreen();
    });
  }
}
