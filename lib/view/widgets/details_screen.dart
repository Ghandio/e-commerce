// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers

import 'package:b_store/const.dart';
import 'package:b_store/core/viewmodel/cart_viewmodel.dart';
import 'package:b_store/model/cart_product_model.dart';
import 'package:b_store/model/product_model.dart';
import 'package:b_store/view/cart_screen.dart';
import 'package:b_store/view/widgets/custom_button.dart';
import 'package:b_store/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  late ProductModel model;

  DetailsScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 270,
            child: Image.network(
              model.image,
              fit: BoxFit.fill,
            )),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(children: [
                CustomText(
                  title: model.name,
                  fontSize: 26,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * .44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: 'Size',
                          ),
                          CustomText(
                            title: model.size,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width * .44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            title: 'Colour',
                          ),
                          Container(
                            width: 30,
                            height: 20,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                              color: model.color,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  title: 'Details',
                  fontSize: 18,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  title: model.description,
                  fontSize: 18,
                  height: 2,
                ),

              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    title: 'PRICE',
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  CustomText(
                    title: model.price+"\$",
                    color: kPrimarycolor,
                    fontSize: 18,
                  )
                ],
              ),
              GetBuilder<CartViewModel>(
                init: CartViewModel(),
                builder:(controller)=> Container(
                  height: 80,
                  padding:EdgeInsets.all(10) ,
                  width: 180,
                  child: CustomButton(
                    onpressed: (){
                              controller.addProduct(
                                CartProductModel(model.name, model.image, 1, model.price,model.productId)
                              );
                    },
                    title: 'ADD',
                  ),
                ),
              )

            ],
          ),
        )
      ],
        ),
      ),
    );
  }
}
