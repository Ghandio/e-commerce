import 'package:b_store/helper/extension.dart';
import 'package:flutter/material.dart';

class CartProductModel {
  late String name, image, price,productId;
  late int quantity;

  CartProductModel(
      this.name,
      this.image,
      this.quantity,
      this.price,
      this.productId);
  CartProductModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    price=map['price'];
    quantity=map['quantity'];
    productId=map['productId'];


  }
  toJson(){
    return{
      'name':name,
      'image':image,
      'price':price,
      'quantity':quantity,
      'productId':productId


    };
  }
}
