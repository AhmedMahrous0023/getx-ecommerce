import 'package:ecommerce_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text ;
  final String imageName ;
  final VoidCallback onpressed ;
  
  const CustomButtonSocial({
     required this.text,
      required this.imageName,
       required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100
      ),
      child:  ElevatedButton(
              onPressed: onpressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: Row(
              children: [
                Image.asset(imageName,width: 20,),
                SizedBox(width: 90,),
                CustomText(
                  text: text,
                alignment: Alignment.centerRight,)

              ],
             )),
    );
  }
}