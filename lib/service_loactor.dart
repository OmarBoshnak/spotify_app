import 'package:get_it/get_it.dart';
import 'package:spoti_third/data/song/sources/song_firebase_service.dart';
import 'package:spoti_third/domain/auth/usecase/signout_usecase.dart';
import 'package:spoti_third/domain/auth/usecase/user_usercase.dart';
import 'package:spoti_third/domain/song/usecase/add_or_remove_favorite.dart';
import 'package:spoti_third/domain/song/usecase/is_favorite.dart';

import 'data/auth/repository/auth_repository_impl.dart';
import 'data/auth/sources/auth_firebase_service.dart';
import 'data/song/repository/song_repository_impl.dart';
import 'domain/auth/repository/auth_repoository.dart';
import 'domain/auth/usecase/signin_usercase.dart';
import 'domain/auth/usecase/signup_usecase.dart';
import 'domain/song/repository/song_repository.dart';
import 'domain/song/usecase/get_news_songs_usecase.dart';
import 'domain/song/usecase/get_play_list_usecase.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<SignoutUsecase>(SignoutUsecase());

  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
      AddOrRemoveFavoriteSongUseCase());
  sl.registerSingleton<IsFavoriteUseCase>(IsFavoriteUseCase());
  sl.registerSingleton<UserUserCase>(UserUserCase());
}
