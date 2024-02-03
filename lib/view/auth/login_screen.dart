import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:ecommerce_getx/view/widgets/custom_textformfield.dart';
import 'package:ecommerce_getx/view/widgets/custombutton.dart';
import 'package:ecommerce_getx/view/widgets/custombutton_social.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Welcome',
                    fontSize: 30,
                  ),
                  CustomText(
                    text: 'Sign Up',
                    fontSize: 18,
                    color: primaryColor,
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
                  onSave: (value) {},
                  validator: (value) {return ;}),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                  text: 'Password',
                  hintText: '************',
                  onSave: (value) {},
                  validator: (value) {return ;}),
                  SizedBox(height: 20,),
              CustomText(
                text: 'Forgot Password?',
                fontSize: 14,
                alignment: Alignment.topRight,
              ),
              SizedBox(height: 20,),
             CustomButton(text: 'Sign in',
             onPressed: (){},
             ),
             SizedBox(height: 20,),
             CustomText(
              text: '-OR-',
              alignment: Alignment.center,
             ),
             SizedBox(height: 40,),
            CustomButtonSocial(
              text: 'Sign in with Facebook',
               imageName:'images/icons/Facebook_icon.svg.png' ,
                onpressed: (){}),
                SizedBox(height: 15,),
                CustomButtonSocial(
                  text: 'Sign in with Google',
                   imageName: 'images/icons/google.jpg',
                    onpressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
