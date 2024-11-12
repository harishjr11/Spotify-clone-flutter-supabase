import 'package:dartz/dartz.dart';
import 'package:demo/core/usecases/usecase.dart';
import 'package:demo/domain/repository/auth/auth.dart';
import 'package:demo/service_locator.dart';

class GetuserUseCase implements Usecase<Either,dynamic> {


  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getUser();
  }

}