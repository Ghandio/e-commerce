// ignore_for_file: prefer_const_constructors
import 'package:b_store/const.dart';
import 'package:b_store/core/viewmodel/control_view_model.dart';
import 'package:b_store/core/viewmodel/home_view_model.dart';
import 'package:b_store/view/auth/login_screen.dart';
import 'package:b_store/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  final List<String> names=<String>['Men','m','m','m','m'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder:(controller)=>controller.loading.value?Center(child: CircularProgressIndicator()): Scaffold(
        body:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100,left:20 ,right:20 ),
            child: Column(
              children: [
               _searchTextFormField(),
                SizedBox(height: 20,),
                CustomText(title: 'Categories',),
                SizedBox(height: 20,),
                _listViewCategory(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween
                ,children: [
                  CustomText(title: "Best Selling",fontSize: 18),
                  CustomText(title: 'See All',fontSize: 16,)
                ],),
                SizedBox(height: 20,),
                _listViewProduct(),

              ],
            ),
          ),
        ),

      ),
    );
  }

  Widget _searchTextFormField() {
    return  Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:Colors.grey.shade200
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,color: Colors.black,)
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder:(controller)=> Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                      padding:EdgeInsets.all(8.0),
                      child: Image.network(controller.categoryModel[index].image)),
                ),
                SizedBox(height: 20,),
                CustomText(title:controller.categoryModel[index].name,)

              ],
            );}, separatorBuilder: ( context, index) =>SizedBox(width: 20,),
        ),
      ),
    );
  }

  Widget _listViewProduct() {
    return Container(
      height: 350,
      child: ListView.separated(
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return Container(
            width: MediaQuery.of(context).size.width * .4,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.shade100
                  ),
                  width: MediaQuery.of(context).size.width * .4,
                  child: Container(

                      height: 220,child: Image.asset('assets/images/watch.png',fit:BoxFit.fill ,)),
                ),
                SizedBox(height: 10,),
                CustomText(title: 'BoePlay Speaker',
                alignment: Alignment.bottomLeft,),
                SizedBox(height: 5,),
                CustomText(title: 'BoePlay Speaker',
                  alignment: Alignment.bottomLeft,color: Colors.grey,),
                SizedBox(height: 5,),
                CustomText(title: "755\$",
                  alignment: Alignment.bottomLeft,color: kPrimarycolor,)
              ],
            ),
          );}, separatorBuilder: ( context, index) =>SizedBox(width: 20,),
      ),
    );
  }


}
