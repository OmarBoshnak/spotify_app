import 'package:dartz/dartz.dart';
import 'package:spoti_third/domain/song/repository/song_repository.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_loactor.dart';

class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getNewsSongs();
  }
}
