import 'package:dartz/dartz.dart';
import 'package:spoti_third/domain/song/repository/song_repository.dart';

import '../../../service_loactor.dart';
import '../sources/song_firebase_service.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    // TODO: implement getNewsSongs
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    // TODO: implement getPlayList
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    // TODO: implement addOrRemoveFavoriteSongs
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSongs(songId);
  }

  @override
  Future<bool> isFavorite(String songId) async {
    return await sl<SongFirebaseService>().isFavorite(songId);
  }
}
