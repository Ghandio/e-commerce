import 'package:b_store/view/cart_screen.dart';
import 'package:b_store/view/home_screen.dart';
import 'package:b_store/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  Widget _currentScreen=HomeScreen();
  get currentScreen=>_currentScreen;
  get navigatorValue=>_navigatorValue;
  int _navigatorValue=0;
  void changeSelectedValue(int selectedValue){
    _navigatorValue=selectedValue;
    switch(selectedValue){
      case 0 : {
        _currentScreen=HomeScreen();
        break;
      }
      case 1 : {
        _currentScreen=CartScreen();
        break;
      }
      case 2 : {
        _currentScreen=ProfileScreen();
        break;
      }
    }
    update();

}
}