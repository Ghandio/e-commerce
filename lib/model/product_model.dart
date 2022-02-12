import 'package:b_store/helper/extension.dart';
import 'package:flutter/material.dart';

class ProductModel {
  late String name, description, image, size, price,productId;
  late Color color;

  ProductModel(
      this.name,
      this.description,
      this.image,
      this.color,
      this.size,
      this.price,
      this.productId);
  ProductModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    color=HexColor.fromHex(map['color']);
    size=map['size'];
    price=map['price'];
    description=map['description'];
    productId=map['productId'];


  }
  toJson(){
    return{
      'name':name,
      'image':image,
      'color':color,
      'size':size,
      'price':price,
      'description':description,
      'productId':productId


    };
}
  }
