import 'package:demo/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  DateTime? releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  // Constructor to create a SongModel from JSON data
  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration']; // Corrected typo
    releaseDate = data['releaseDate'] != null 
        ? DateTime.parse(data['releaseDate']) // Parse to DateTime
        : null;
  }
}

// Extension to convert SongModel to SongEntity
extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
    );
  }
}
