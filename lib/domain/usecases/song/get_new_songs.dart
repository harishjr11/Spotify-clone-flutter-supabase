import 'package:dartz/dartz.dart';
import 'package:demo/core/usecases/usecase.dart';
import 'package:demo/data/repository/song/song_repository_impl.dart';
import 'package:demo/service_locator.dart';

class GetNewSongsUseCase implements Usecase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepositoryImpl>().getNewSongs();
  }
}