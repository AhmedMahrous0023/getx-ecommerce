import 'package:ecommerce_getx/core/services/DataBase/cart_database_helper.dart';
import 'package:ecommerce_getx/core/view_model/cart_view_model.dart';
import 'package:ecommerce_getx/helper/binding.dart';
import 'package:ecommerce_getx/view/auth/login_screen.dart';
import 'package:ecommerce_getx/view/controlview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CartDatabaseHelper.db.initDb();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  Get.put(CartViewModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body:ControlView()
      ),
      // theme: ThemeData(
      //   fontFamily: 'sourceSans'
      // ),
    );
  }
}