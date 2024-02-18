import 'package:ecommerce_getx/core/services/firestore_user.dart';
import 'package:ecommerce_getx/model/user_model.dart';
import 'package:ecommerce_getx/view/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googlesignin = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();

   Rx<User?>_user =Rx<User?>(null);

   String? get user =>_user.value?.email ;

  String? email, password, name;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googlesignin.signIn();
    print(googleUser);

    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    AuthCredential credential = await GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
  }

  void facebookLogininMethod() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(permissions: [FacebookPermission.email]);
    final accessToken = result.accessToken!.token;
    if (result.status == FacebookLoginStatus.success) {
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(facebookCredential);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
          Get.offAll(HomeScreen());
    } catch (e) {
      print(e.toString());

      Get.snackbar('Error', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword()async{
try {
      await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!).then((user) async{
           
            saveUser(user);
          });
          Get.offAll(()=>HomeScreen());
    } catch (e) {
      print(e.toString());

      Get.snackbar('Error', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser (UserCredential user)async{
    await FireStoreUser().addUserToFIreStore(UserModel(
              userId: user.user!.uid,
              email: user.user!.email,
              name: name==null?user.user!.displayName:name,
              pic: ''
            ));
  }
}









// final GoogleSignInAccount? googleUser = await _googlesignin.signIn();
//     print(googleUser);
//     GoogleSignInAuthentication googleSignInAuth =
//         await googleUser!.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleSignInAuth.idToken,
//         accessToken: googleSignInAuth.accessToken);

//    await _auth.signInWithCredential(credential);