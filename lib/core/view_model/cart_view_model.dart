import 'package:ecommerce_getx/core/services/DataBase/cart_database_helper.dart';
import 'package:ecommerce_getx/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

  ValueNotifier<bool>get  loading  =>_loading ;

  ValueNotifier<bool>_loading = ValueNotifier(false) ;

  List<CartProductModel>_cartProductModel  =<CartProductModel>[];
    List<CartProductModel>get cartProductModel  =>_cartProductModel;
    double get totalPrice=>_totalPrice;
    double _totalPrice=0.0;

    CartViewModel(){
       getAllProduct();
    }


  getAllProduct()async{
    _loading.value =true ;
    var dbHelper =CartDatabaseHelper.db;
    _cartProductModel=await dbHelper.getAllProduct();
    print('777777777777777777777777777777777777777777${_cartProductModel.length }');
    _loading.value =false ;
    getTotalPrice();
    update();
  }

  getTotalPrice(){
  for(int i =0; i<_cartProductModel.length;i++){
    _totalPrice +=(double.parse(_cartProductModel[i].price! )* _cartProductModel[i].quantity!)   ;
    print(_totalPrice);
    update();
  }
}

  addProduct(CartProductModel cartProductModel) async {
    print('5555555555555555555');
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
            print('11111111111111111111111111111111111111111111${_cartProductModel.length}');

      return;
      }
    } 
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=(double.parse(cartProductModel.price! )* cartProductModel.quantity!)   ;

    update();
}

deleteCartItems()async{
  await CartDatabaseHelper.db.deleteAllProducts();
  update();
}
}
