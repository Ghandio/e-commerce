import 'package:b_store/core/services/database/cart_database_helper.dart';
import 'package:b_store/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{
  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool> _loading=ValueNotifier(false);
  List<CartProductModel> _cartProductModel=[];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel(){
    getAllProduct();
  }
  addProduct(CartProductModel cartProductModel)async{
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    update();
  }

  getAllProduct()async{
      _loading.value=true;
      var dbHelper = CartDatabaseHelper.db;
      _cartProductModel= await dbHelper.getAllProduct();
      print(_cartProductModel.length);
      _loading.value=false;
      update();
  }





}