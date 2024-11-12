import 'package:demo/domain/entities/auth/user.dart';

class UserModel{

  String ? fullName;
  String ? email;

  UserModel({
    this.fullName,
    this.email
  });


  UserModel.fromJson(Map<String,dynamic> data){
    fullName = data['name'];
    email = data['email'];
  }
}

extension UserModelX on UserModel{
  UserEntity toEntity(){
    return UserEntity(
      fullName: fullName,
      email: email
    );
  }
}