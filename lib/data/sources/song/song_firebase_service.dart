import 'package:dartz/dartz.dart';
import 'package:demo/domain/entities/song/song.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:demo/data/models/song/song.dart';

abstract class SongFirebaseService {
  Future<Either<String, List<SongEntity>>> getNewSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either<String, List<SongEntity>>> getNewSongs() async {
    try {
      final data = await Supabase.instance.client
          .from('Songs')
          .select()
          .order('releaseDate', ascending: false)
          .limit(3);

      // Check if the data is empty
      if (data.isEmpty) {
        return const Left("No data found");
      }

      // Convert each JSON element in data to SongEntity using SongModel
      List<SongEntity> songs = (data as List<dynamic>)
          .map((element) => SongModel.fromJson(element).toEntity())
          .toList();

      // Return Right with the list of songs
      return Right(songs);
    } catch (e) {
      return Left('An error occurred: ${e.toString()}');
    }
  }
}
