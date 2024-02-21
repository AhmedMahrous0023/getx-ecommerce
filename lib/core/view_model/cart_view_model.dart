import 'package:ecommerce_getx/core/services/DataBase/cart_database_helper.dart';
import 'package:ecommerce_getx/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  bool get loading => _loading;
  bool _loading = false;

  List<CartProductModel> _cartProductModel = <CartProductModel>[];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
      var dbHelper = CartDatabaseHelper.db;


  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading = true;
    cartProductModel.addAll(await dbHelper.getAllProduct());
    print(
        '777777777777777777777777777777777777777777${_cartProductModel.length}');
    getTotalPrice();
    _loading = false;
    update();
  }

  getTotalPrice() {
    for (var product in _cartProductModel) {
      _totalPrice += (double.parse(product.price!) * product.quantity!);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    print('5555555555555555555');
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        print(
            '11111111111111111111111111111111111111111111${_cartProductModel.length}');

        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price!) * cartProductModel.quantity!);
    update();
  }

  void increaseQuantity(int index)async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1;
    _totalPrice += double.parse(_cartProductModel[index].price!);
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  void decreaseQuantity(int index) async{
    if (_cartProductModel[index].quantity! > 0) {
      _cartProductModel[index].quantity =
          _cartProductModel[index].quantity! - 1;
      _totalPrice -= double.parse(_cartProductModel[index].price!);
          await dbHelper.updateProduct(_cartProductModel[index]);
      update();
    }
  }

  deleteCartItems() async {
    await CartDatabaseHelper.db.deleteAllProducts();
    update();
  }
}
