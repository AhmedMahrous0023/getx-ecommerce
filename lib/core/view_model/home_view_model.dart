import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_getx/core/services/home_service.dart';
import 'package:ecommerce_getx/model/category_model.dart';
import 'package:ecommerce_getx/model/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

ValueNotifier<bool> get loading=>_loading ;
  ValueNotifier<bool> _loading =ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;

  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
   List<ProductModel> _productModel = [];


  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }
  getCategory() async {
    _loading.value=true ;
    final List<QueryDocumentSnapshot> docs = await HomeService().getCategory() ;
      _categoryModel.clear();
      for (var doc in docs) {
        final Map<dynamic, dynamic>? data =
            doc.data() as Map<dynamic, dynamic>?;
        if (data != null) {
          _categoryModel.add(CategoryModel.fromJson(data));
          _loading.value=false;
        }
        update();
      }
  }

  getBestSellingProducts()async{
    _loading.value =true ;
   final List<QueryDocumentSnapshot> docs=await HomeService().getBestSelling();
   _productModel.clear();
   for (var doc in docs) {
     final Map<dynamic, dynamic>? data =
            doc.data() as Map<dynamic, dynamic>?;
        if (data != null) {
          _productModel.add(ProductModel.fromJson(data));
          _loading.value=false;
        }
        update();
   }
  }
}
