import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed ;

  const CustomButton(
      {this.text = 'sign',
      this.backgroundColor = primaryColor,
       required this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        child:CustomText(text: text,alignment: Alignment.center,color: Colors.white,),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
            backgroundColor: backgroundColor, ),
      ),
    );
  }
}
