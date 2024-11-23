import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoti_third/presentation/home/bloc/new_song_states.dart';

import '../../../domain/song/usecase/get_news_songs_usecase.dart';
import '../../../service_loactor.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();
    if (isClosed) return;
    returnedSongs.fold((l) {
      if (isClosed) emit(NewsSongsLoadFailure());
    }, (data) {
      if (isClosed) emit(NewsSongsLoaded(songs: data));
    });
  }
}
