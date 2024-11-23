import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoti_third/common/bloc/favorite_button_state.dart';
import 'package:spoti_third/domain/song/usecase/add_or_remove_favorite.dart';
import 'package:spoti_third/domain/song/usecase/is_favorite.dart';
import 'package:spoti_third/service_loactor.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitil());

  void favoriteButtonUpdated(String songId) async {
    var result =
        await sl<AddOrRemoveFavoriteSongUseCase>().call(params: songId);
    result.fold(
      (l) {},
      (isFavorite) {
        emit(FavoriteButtonUpdated(isFavorite: isFavorite));
      },
    );
  }
}
