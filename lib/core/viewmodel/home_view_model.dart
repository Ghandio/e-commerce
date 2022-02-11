// ignore_for_file: prefer_final_fields

import 'package:b_store/core/services/home_service.dart';
import 'package:b_store/model/category_model.dart';
import 'package:b_store/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  //create a loading value notifier to check if a loading CircularProgressIndicator needed to be added or not
  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool> _loading=ValueNotifier(false);
  //create a category model private list and a getter for it
  List<CategoryModel> get categoryModel=>_categoryModel;
  List<CategoryModel>  _categoryModel=[];
  //create a product model private list and a getter for it
  List<ProductModel> get productModel=>_productModel;
  List<ProductModel>  _productModel=[];

  HomeViewModel(){
    getCategory();
    getBestSellingProduct();
  }


  getCategory()async{
    _loading.value=true;
    HomeService().getCategory().then((value) {
      for(int i =0;i<value.length;i++ ){
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<String,dynamic>));
        _loading.value=false;
      }
      print(_categoryModel.length);
      update();
    });
  }
  getBestSellingProduct() async{
    _loading.value=true;
    HomeService().getBestSellingProducts().then((value) {
        for(int i=0;i<value.length;i++){
          _productModel.add(ProductModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
          _loading.value=false;
        }
        print(_productModel.length);
        update();
    });
  }

}