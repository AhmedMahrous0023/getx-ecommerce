import 'package:ecommerce_getx/core/view_model/control_view_model.dart';
import 'package:ecommerce_getx/view/auth/login_screen.dart';
import 'package:ecommerce_getx/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Get.find<AuthViewModel>().user == null ? LoginScreen() :
        GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
          builder: (controller)=>
           Scaffold(
            bottomNavigationBar: _bottomNavigationBar(),
            body: controller.currentScreen,
           ),
        ) );
  }
}
Widget _bottomNavigationBar() {
  return GetBuilder<ControlViewModel>(
    init: Get.find<ControlViewModel>(),
    builder: (controller) => 
     BottomNavigationBar(
      elevation: 0.0,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.grey.shade50,
      currentIndex: controller.navigatorValue,
      onTap: (index){
controller.changeSelectedValue(index) ;
      },
      items: [
        BottomNavigationBarItem(
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text('Explore'),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Icon(Icons.explicit_outlined),
          ),label: ''),
              BottomNavigationBarItem(
                activeIcon:  Padding(
            padding: const EdgeInsets.only(top: 25),
                  child: Text('Cart'),
                ),
                icon: Padding(
            padding: const EdgeInsets.only(top: 20),
                  child: Icon(Icons.shopping_cart),
                ),label: ''),
                    BottomNavigationBarItem(
                      activeIcon:  Padding(
            padding: const EdgeInsets.only(top: 25),
                        child: Text('Account'),
                      ),
                      icon: Padding(
            padding: const EdgeInsets.only(top: 20),
                        child: Icon(Icons.person),
                      ),label: ''),
    
    
      ]),
  );
 }