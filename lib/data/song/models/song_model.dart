import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/song/entities/song_entities.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
  String? songId;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releaseDate,
      required this.isFavorite,
      required this.songId});

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title ?? 'Unknown Title', // Provide default value if null
      artist: artist ?? 'Unknown Artist', // Provide default value if null
      duration: duration ?? 0, // Provide default value if null
      releaseDate: releaseDate ??
          Timestamp.now(), // Default to current timestamp if null
      isFavorite: isFavorite ?? false, // Default to false if null
      songId: songId ?? 'Unknown Song ID', // Provide default value if null
    );
  }
}
