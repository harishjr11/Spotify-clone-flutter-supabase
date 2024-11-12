// import 'package:dartz/dartz.dart';
// import 'package:demo/data/models/auth/create_user_req.dart';
// import 'package:demo/data/models/auth/signin_user_req.dart';
// import 'package:demo/data/sources/auth/auth_firebase_service.dart';
// import 'package:demo/domain/repository/auth/auth.dart';
// import 'package:demo/service_locator.dart';

// class AuthRepositoryImpl extends AuthRepository{


//   @override
//   Future<Either> signin(SigninUserReq signinUserReq) async {
//     return await sl<AuthSupabaseService>().signin(signinUserReq);
//   }

//   @override
//   Future<Either> signup(CreateUserReq createUserReq) async {
//     return await sl<AuthSupabaseService>().signup(createUserReq);
//   }
  
//   @override
//   Future<Either> getUser() async {
//     return await sl<AuthSupabaseService>().getUser();
//   }
// }  