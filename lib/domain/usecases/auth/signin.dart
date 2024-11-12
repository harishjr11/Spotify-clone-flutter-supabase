import 'package:dartz/dartz.dart';
import 'package:demo/core/usecases/usecase.dart';
import 'package:demo/data/models/auth/signin_user_req.dart';
import 'package:demo/domain/repository/auth/auth.dart';
import 'package:demo/service_locator.dart';

class SignInUseCase implements Usecase<Either,SigninUserReq> {


  @override
  Future<Either> call({SigninUserReq ? params}) async {
    return sl<AuthRepository>().signin(params!);
  }


}