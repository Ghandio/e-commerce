// ignore_for_file: prefer_final_fields

import 'package:b_store/helper/local_storage_data.dart';
import 'package:b_store/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController{
  ValueNotifier<bool> get loading=> _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  final LocalStorageData localStorageData=Get.find<LocalStorageData>();
  UserModel? get userModel => _userModel;
  UserModel? _userModel;
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }
  Future<void> signOut()async{
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser()async {
    _loading.value=true;
    await localStorageData.getUser.then((value) {
      _userModel=value!;
    });
    _loading.value=false;
    update();
  }
}