import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/model/product_model.dart';
import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:ecommerce_getx/view/widgets/custombutton.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel? model;
  DetailsScreen({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  child: Image.network(
                    model!.image!,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(18),
                      child: CustomText(
                        text: model!.name!,
                        fontSize: 26,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: 'Size',
                            ),
                            CustomText(
                              text: model!.size!,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: 'Color',
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                color: model!.color,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        CustomText(
                          text: 'Details',
                          fontSize: 18,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: model!.describtion!,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(text: 'PRICE',color: Colors.grey,fontSize: 22,),
                            CustomText(text: 'EGP ${model!.price}',color: primaryColor,fontSize: 18,),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: 180,
                          height: 100,
                          child: CustomButton(onPressed: (){},text: ' Add',))
                                              
                    
                    
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
