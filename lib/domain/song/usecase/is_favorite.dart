import 'package:dartz/dartz.dart';
import 'package:spoti_third/domain/song/repository/song_repository.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_loactor.dart';

class IsFavoriteUseCase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    // TODO: implement call
    return await sl<SongRepository>().isFavorite(params!);
  }
}
