
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:b_store/core/viewmodel/auth_view_model.dart';
import 'package:b_store/core/viewmodel/control_view_model.dart';
import 'package:b_store/view/auth/login_screen.dart';
import 'package:b_store/view/cart_screen.dart';
import 'package:b_store/view/home_screen.dart';
import 'package:b_store/view/profile_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ControlView extends GetWidget<AuthViewModel> {

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return(Get.find<AuthViewModel>().user==null)
          ?LoginScreen()
          :GetBuilder<ControlViewModel>(
        init: ControlViewModel(),
            builder:(controller)=> Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: _bottomNavigationBar(),),
          );
    });
  }
  Widget _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller)=> BottomNavigationBar(items: [
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("Explore"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset('assets/images/explore.png',
                fit: BoxFit.contain,width: 20,),
            )),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text('Cart'),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset('assets/images/cart.png',
                fit: BoxFit.contain,width: 20,),
            )),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("Account"),
            ),
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset('assets/images/user.png',
                fit: BoxFit.contain,width: 20,),
            ))
      ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);

        },

        elevation: 0.0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade100,
      ),
    );
  }
}
