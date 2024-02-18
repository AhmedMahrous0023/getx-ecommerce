import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:ecommerce_getx/view/widgets/custom_textformfield.dart';
import 'package:ecommerce_getx/view/widgets/custombutton.dart';
import 'package:ecommerce_getx/view/widgets/custombutton_social.dart';
import 'package:ecommerce_getx/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  CustomText(
                    text: 'Sign Up',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                      text: 'Name',
                      hintText: 'Ahmed',
                      onSave: (value) {
                        controller.name = value;
                      },
                      validator: (value) {}),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                      text: 'Email',
                      hintText: 'iamdavid@gmail.com',
                      onSave: (value) {
                        controller.email = value;
                      },
                      validator: (value) {
                        if (value == null) {
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
                        controller.password = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print('Error');
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'Sign up',
                    onPressed: () {
                      _formKey.currentState!.save();
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
