import 'dart:convert';

import 'package:ecommerce_getx/constance.dart';
import 'package:ecommerce_getx/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CASHED_USER_DATA, jsonEncode(userModel.toJson()));
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CASHED_USER_DATA);
    return UserModel.fromJson(jsonDecode(value!));
  }

  Future<UserModel?> get getUser async {
    try {
      UserModel? userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  void deleteUser()async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.clear();
  }
}
