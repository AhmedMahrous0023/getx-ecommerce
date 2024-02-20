import 'package:ecommerce_getx/helper/extention.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? name, image,productId, describtion, size,price;
  Color? color ;

  ProductModel(
      {this.size, this.name,this.productId, this.color, this.describtion, this.image,this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    size = map['size'];
    color = HexColor.fromHex(map['color']);
    describtion = map['describtion'];
    price=map['price'];
    productId=map['productId'];
  }

  toJson(){
    return {
      'name':name,
      'describtion':describtion,
      'size':size,
      'color':color?.toHex(),
      'image':image,
      'price':price,
      'productId':productId
    };


  }
}
