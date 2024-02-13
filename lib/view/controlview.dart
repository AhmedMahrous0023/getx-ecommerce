import 'package:ecommerce_getx/view/auth/login_screen.dart';
import 'package:ecommerce_getx/view/homescreen.dart';
import 'package:ecommerce_getx/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
    Get.find<AuthViewModel>().user!= null ? HomeScreen():LoginScreen() );
  }
}