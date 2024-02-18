import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/view/auth/register_screen.dart';
import 'package:ecommerce_getx/view/homescreen.dart';
import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:ecommerce_getx/view/widgets/custom_textformfield.dart';
import 'package:ecommerce_getx/view/widgets/custombutton.dart';
import 'package:ecommerce_getx/view/widgets/custombutton_social.dart';
import 'package:ecommerce_getx/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
   LoginScreen({super.key});

final GlobalKey<FormState>_formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Welcome',
                        fontSize: 30,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(RegisterScreen());
                        },
                        child: CustomText(
                          text: 'Sign Up',
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: 'Sign in to Continue',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      text: 'Email',
                      hintText: 'iamdavid@gmail.com',
                      onSave: (value) {
                       controller.email =value ;
                      },
                      validator: (value) {
                        if (value == null){
                          print('Error');
                        }
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      text: 'Password',
                      hintText: '************',
                      onSave: (value) {
                                             controller.password=value ; 
              
                      },
                      validator: (value) {
                        if (value == null){
                          print('Error');
                        }
                        
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: 'Forgot Password?',
                    fontSize: 14,
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'Sign in',
                    onPressed: () {
                                          _formKey.currentState!.save();
                      if(_formKey.currentState!=null && _formKey.currentState!.validate()){
                      controller.signInWithEmailAndPassword();
              
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: '-OR-',
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButtonSocial(
                      text: 'Sign in with Facebook',
                      imageName: 'images/icons/Facebook_icon.svg.png',
                      onpressed: () {}),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButtonSocial(
                      text: 'Sign in with Google',
                      imageName: 'images/icons/google.jpg',
                      onpressed: () {
                        controller.googleSignInMethod();
                        Get.offAll(()=>HomeScreen());
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
