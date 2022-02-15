// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, unnecessary_string_interpolations

import 'package:b_store/const.dart';
import 'package:b_store/core/viewmodel/cart_viewmodel.dart';
import 'package:b_store/model/cart_product_model.dart';
import 'package:b_store/view/widgets/custom_button.dart';
import 'package:b_store/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => Scaffold(
          body: controller.cartProductModel.length==0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset(
                      'assets/images/cart_empty.svg',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Cart Empty',
                      style:
                          TextStyle(fontSize: 30, color: Colors.grey.shade600),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                                height: 140,
                                child: Row(
                                  children: [
                                    Container(
                                        width: 120,
                                        child: Image.network(
                                          controller
                                              .cartProductModel[index].image,
                                          fit: BoxFit.fill,
                                        )),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            title: controller
                                                .cartProductModel[index].name,
                                            fontSize: 24,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            color: kPrimarycolor,
                                            title:
                                                '${controller.cartProductModel[index].price.toString()}' +
                                                    '\$',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 140,
                                            color: Colors.grey.shade200,
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                  ),
                                                  onTap: () {
                                                    controller.increaseQuantity(
                                                        index);
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                CustomText(
                                                  title: controller
                                                      .cartProductModel[index]
                                                      .quantity
                                                      .toString(),
                                                  alignment: Alignment.center,
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                GestureDetector(
                                                  child: Container(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: Icon(
                                                        Icons.minimize,
                                                        color: Colors.black,
                                                      )),
                                                  onTap: () {
                                                    controller.decreaseQuantity(
                                                        index);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          },
                          itemCount: controller.cartProductModel.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(children: [
                            CustomText(
                              title: 'TOTAL',
                              fontSize: 22,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            GetBuilder<CartViewModel>(
                                init: CartViewModel(),
                                builder: (controller) => CustomText(
                                      title: ' ${controller.totalPrice}\$',
                                      color: kPrimarycolor,
                                      fontSize: 18,
                                    ))
                          ]),
                          Container(
                            padding: EdgeInsets.all(20),
                            height: 90,
                            width: 180,
                            child: CustomButton(
                              onpressed: () {},
                              title: 'CHECKOUT',
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
    );
  }
}
