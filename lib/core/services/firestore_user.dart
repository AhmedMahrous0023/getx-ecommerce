import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_getx/model/user_model.dart';

class FireStoreUser{
  final CollectionReference _userCollectionRef =FirebaseFirestore.instance.collection('Users');

  Future <void> addUserToFIreStore(UserModel userModel)async{
    return await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot>getCurrentUser(String uid )async{
    return await _userCollectionRef.doc(uid).get() ;

  }
}