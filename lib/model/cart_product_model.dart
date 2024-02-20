import 'package:flutter/material.dart';

class CartProductModel {
  String? name, productId,image, price;
  int? quantity ;

  CartProductModel(
      {this.quantity, this.name, this.productId, this.image,this.price});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price=map['price'];
    quantity =map['quantity'];
    productId=map['productId'];
  }

  toJson(){
    return {
      'name':name,
      'image':image,
      'price':price,
      'quantity':quantity,
      'productId':productId
    };


  }
}
