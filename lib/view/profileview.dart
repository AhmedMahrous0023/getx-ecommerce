import 'package:ecommerce_getx/core/view_model/profile_view_model.dart';
import 'package:ecommerce_getx/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => 
       Scaffold(
        body: SafeArea(
          child: Container(
            child: MaterialButton(onPressed: (){
              controller.signOut();
              Get.offAll(LoginScreen());
            },child: Center(child: Text('Sign Out')),),
          ),
        ),
      ),
    );
  }
}