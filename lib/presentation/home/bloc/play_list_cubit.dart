import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoti_third/presentation/home/bloc/play_list_state.dart';

import '../../../domain/song/usecase/get_play_list_usecase.dart';
import '../../../service_loactor.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();
    if (isClosed) return;
    returnedSongs.fold((l) {
      if (!isClosed) emit(PlayListLoadFailure());
    }, (data) {
      if (!isClosed) emit(PlayListLoaded(songs: data));
    });
  }
}
