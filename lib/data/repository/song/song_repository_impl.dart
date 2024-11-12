import 'package:dartz/dartz.dart';
import 'package:demo/data/sources/song/song_firebase_service.dart';
import 'package:demo/domain/repository/song/song.dart';
import 'package:demo/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewSongs() async {

    return await sl<SongFirebaseService>().getNewSongs();
  }

  
}

