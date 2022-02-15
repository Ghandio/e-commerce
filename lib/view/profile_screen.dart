// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:b_store/const.dart';
import 'package:b_store/core/viewmodel/profile_view_model.dart';
import 'package:b_store/view/auth/login_screen.dart';
import 'package:b_store/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value == true
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
              padding: EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                              image: DecorationImage(
                                  image: controller.userModel?.pic == null
                                      ? AssetImage('assets/images/avatar.png')
                                      : controller.userModel?.pic == 'default'
                                          ? AssetImage(
                                              'assets/images/avatar.png')
                                          : NetworkImage(
                                                  controller.userModel!.pic!)
                                              as ImageProvider,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                title: controller.userModel!.name!,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              CustomText(
                                title: controller.userModel!.email!,
                                color: Colors.black,
                                fontSize: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    ProfileTiles('Edit Profile',() { },'assets/images/edit_icn.png'),
                    SizedBox(
                      height: 2,
                    ),
                    ProfileTiles('Shipping Address',() { },'assets/images/location_icn.png'),
                    SizedBox(
                      height: 2,
                    ),
                    ProfileTiles('Order History',() { },'assets/images/history_icn.png'),
                    SizedBox(
                      height: 2,
                    ),
                    ProfileTiles('Cards',() { },'assets/images/payment_icn.png'),
                    SizedBox(
                      height: 2,
                    ),
                    ProfileTiles('Notifications',() { },'assets/images/alert_icn.png'),
                    SizedBox(
                      height: 2,
                    ),
                    ProfileTiles('Log Out',() {
                      controller.signOut();
                      Get.offAll(LoginScreen());
                    },'assets/images/exit_icn.png'),
                  ],
                ),
              ),
            )),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final String imageAssetStr;

  ProfileTiles(this.title, this.onPressed,this.imageAssetStr);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        child: ListTile(
          title: CustomText(
            title: title,
          ),
          leading: Image.asset(imageAssetStr),
          trailing: Icon(Icons.navigate_next,
          color: Colors.black,),
        ),
      ),
    );
  }
}
