import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/core/view_model/cart_view_model.dart';
import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:ecommerce_getx/view/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init:Get.find<CartViewModel>() ,
              builder: (controller)=>
               Container(
                child: ListView.separated(
                    itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 15),
                                  width: 120,
                                  child: Image.network(
                                    controller.cartProductModel[index].image!,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 30,right: 15),
                                child: Column(
                                  children: [
                                    CustomText(
                                      text: controller.cartProductModel[index].name!,
                                      fontSize: 19,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CustomText(
                                      text: 'EGP ${controller.cartProductModel[index].price!.toString()}',
                                      color: primaryColor,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: 140,
                                      color: Colors.grey.shade200,
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CustomText(
                                            text: '1',
                                            fontSize: 20,
                                            alignment: Alignment.center,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                              padding: EdgeInsets.only(bottom: 20),
                                              child: Icon(Icons.minimize))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 15),
                    itemCount: controller.cartProductModel.length),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'TOTAL',
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 15,),
                     GetBuilder<CartViewModel>(
                      id: Get.find<CartViewModel>(),
                      builder: (controller)=>
                       CustomText(
                        text: '${controller.totalPrice}',
                        fontSize: 18,
                        color: primaryColor,
                        
                                           ),
                     ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: 100,
                  width: 180,
                  child: CustomButton(onPressed: (){},text: 'CHECK OUT',))
              ],
            ),
          )
        ],
      ),
    );
  }
}
