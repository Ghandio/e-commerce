import 'dart:convert';

import 'package:b_store/const.dart';
import 'package:b_store/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{

Future<UserModel?> get getUser async{
  try{
    UserModel userModel=await _getUserData();
    if(userModel==null){
      return null;
    }
    return userModel;
  }
  catch(e){
    print(e);
    return null;
  }
}


  setUser(UserModel userModel)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(kCachedUserData, jsonEncode(userModel.toJson()));
  }
  
  _getUserData()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var value = preferences.getString(kCachedUserData);
    return UserModel.fromJson(jsonDecode(value!));

  }
  void deleteUser()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();

  }
  
  
  
}