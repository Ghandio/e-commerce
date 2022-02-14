// ignore_for_file: prefer_const_constructors
import 'package:b_store/helper/binding.dart';
import 'package:b_store/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:b_store/view/auth/login_screen.dart';
import 'package:get/get.dart';
import 'core/viewmodel/cart_viewmodel.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        body: ControlView (

        ),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSans'

      ),
    );
  }
}
