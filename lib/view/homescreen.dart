import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/core/view_model/home_view_model.dart';
import 'package:ecommerce_getx/view/details_screen.dart';
import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final List<String> names = <String>['s', 's', 's', 's', 's'];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(init: Get.find<HomeViewModel>(),
    builder: (controller)=>controller.loading.value?Center(child: CircularProgressIndicator(),):
       Scaffold(
          body: SingleChildScrollView(
            child: Container(
                    padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                    child: Column(
            children: [
             _searchtextformField(),
              SizedBox(
                height: 30,
              ),
              CustomText(
                text: 'Categories',
                fontSize: 25,
              ),
              SizedBox(
                height: 30,
              ),
              _listViewCategory(),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Best Selling',fontSize: 18),
                                CustomText(text: 'See All',fontSize: 18,)
                  
                ],
              ),
                        SizedBox(height: 30,),
              _listviewProducts(),
            ],
                    ),
                  ),
          )),
    );
  }

  
 Widget _listViewCategory() {
  return GetBuilder<HomeViewModel>(
    builder: (controller)=>
     Container(
              height: 110,
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoryModel.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            width: 70,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.shade100),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(controller.categoryModel[index].image!),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            text: controller.categoryModel[index].name!,
                          )
                        ],
                      )),
            ),
  );
 }
 
 Widget _searchtextformField() {
  return  Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
          );
 }
 
 Widget _listviewProducts() {
  return GetBuilder<HomeViewModel>(
    builder: (controller)=>
    Container(
              height: 350,
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.productModel.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: (){
                      Get.to(() => DetailsScreen(model: controller.productModel[index],));
                    },
                    child: Container(
                                                  width: MediaQuery.of(context).size.width*0.4,
                      child: Column(
                            children: [
                              Container(
                                height: 220,
                                width: MediaQuery.of(context).size.width*0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey.shade100),
                                child: Image.network(controller.productModel[index].image!,fit: BoxFit.fill,),
                              ),
                              SizedBox(height: 10,),
                              CustomText(text:controller.productModel[index].name! ,alignment: Alignment.bottomLeft,),
                                                        SizedBox(height: 10,),
                        
                              CustomText(text:controller.productModel[index].describtion! ,alignment: Alignment.bottomLeft,color: Colors.grey,),
                                                        SizedBox(height: 10,),
                        
                              CustomText(text: 'EGP ${controller.productModel[index].price!}' ,alignment: Alignment.bottomLeft,color: primaryColor,)
                            
                            ],
                          ),
                    ),
                  )),
            ),
  );
 }
 
 
}
