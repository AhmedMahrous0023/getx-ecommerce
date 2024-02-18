import 'package:ecommerce_getx/view/cartview.dart';
import 'package:ecommerce_getx/view/homescreen.dart';
import 'package:ecommerce_getx/view/profileview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  int _navigatorValue =0;
  get navigatorValue =>_navigatorValue ;
  Widget _currentScreen =HomeScreen();
 get currentScreen =>_currentScreen ;

  void changeSelectedValue(int selectedValue){
    _navigatorValue=selectedValue ;
    switch (selectedValue){

  case 0:{
    _currentScreen =HomeScreen();
    break ;
  }
  case 1 :{
    _currentScreen =CartView();
    break ;
  }
  case 2 :{
    _currentScreen =ProfileView();
    break;
  }
}
    update();

  }
}

