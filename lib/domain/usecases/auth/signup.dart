import 'package:dartz/dartz.dart';
import 'package:demo/core/usecases/usecase.dart';
import 'package:demo/data/models/auth/create_user_req.dart';
import 'package:demo/domain/repository/auth/auth.dart';
import 'package:demo/service_locator.dart';

class SignupUseCase implements Usecase<Either,CreateUserReq> {


  @override
  Future<Either> call({CreateUserReq ? params}) async {
    return sl<AuthRepository>().signup(params!);
  }


}