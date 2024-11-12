import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo/domain/usecases/auth/getuser.dart';
import 'package:demo/service_locator.dart';
import 'package:demo/views/bloc/profile_info_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {

  ProfileInfoCubit() : super (ProfileInfoLoading());

  Future<void> getUser() async {

    var user = await sl<GetuserUseCase>().call();

    user.fold(
      (l){
        emit(
        ProfileInfoFailure()
        );
      },
      (userEntity){
        emit(
          ProfileInfoLoaded(
            userEntity: userEntity)
        );
      }
    );
  }
}