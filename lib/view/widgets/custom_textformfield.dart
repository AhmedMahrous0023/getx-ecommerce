import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text ;
  final String hintText;
  final void Function(String?) onSave ;
  final String? Function(String?) validator;
  
   CustomTextFormField({
      required this.text,
       required this.hintText, 
       required this.onSave,
        required this.validator
       });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            fontSize: 14,
            color: Colors.black,
          ),
          TextFormField(
            onSaved:onSave ,
            validator: validator,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: Colors.white,
                filled: true),
          ),
        ],
      ),
    );
  }
}
