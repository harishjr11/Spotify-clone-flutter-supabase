import 'package:get_it/get_it.dart';
import 'package:demo/data/repository/auth/auth_repository_impl.dart';
import 'package:demo/data/repository/song/song_repository_impl.dart';
import 'package:demo/data/sources/auth/auth_firebase_service.dart';
import 'package:demo/data/sources/song/song_firebase_service.dart';
import 'package:demo/domain/repository/auth/auth.dart';
import 'package:demo/domain/repository/song/song.dart';
import 'package:demo/domain/usecases/auth/getuser.dart';
import 'package:demo/domain/usecases/auth/signin.dart';
import 'package:demo/domain/usecases/auth/signup.dart';
import 'package:demo/domain/usecases/song/get_new_songs.dart';

final sl = GetIt.instance;

Future<void> intializeDependencies() async{



  sl.registerSingleton<SongFirebaseService>(
      SongFirebaseServiceImpl()
  );



  sl.registerSingleton<SongsRepository>(
      SongRepositoryImpl()
  );

    sl.registerSingleton<SignupUseCase>(
      SignupUseCase()
  );

    sl.registerSingleton<SignInUseCase>(
      SignInUseCase()
  );

    sl.registerSingleton<GetNewSongsUseCase>(
      GetNewSongsUseCase()
  );

    sl.registerSingleton<GetuserUseCase>(
      GetuserUseCase()
  );


}