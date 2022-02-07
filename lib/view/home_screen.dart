import 'package:b_store/view/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  FirebaseAuth _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home SCREEN"),
      ),
      body: Center(
        child: FlatButton(onPressed: () {
          _auth.signOut();
          Get.offAll(LoginScreen());
        }, child: Text('Logout'),),
        ),
    );
  }
}
