class UserModel{
  String? userId ,name,email,pic ;
  
  UserModel({this.email,this.name,this.pic,this.userId});

  UserModel.fromJson(Map<dynamic,dynamic>map){
    if (map ==null){
      return ;
    }
    userId=map['userId'];
    email=map['email'];
    name=map['name'];
    pic=map['pic'];
  }
  toJson(){
   return{
'userId':userId ,
'email':email ,
'name':name,
'pic':pic 
   } ;
  }
}