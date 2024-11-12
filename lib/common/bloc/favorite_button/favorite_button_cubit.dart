// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:demo/common/bloc/favorite_button/favorite_button_state.dart';
// import 'package:demo/domain/usecases/song/add_or_remove_favorite_song.dart';
// import 'package:demo/service_locator.dart';

// class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {

//   FavoriteButtonCubit() : super(FavoriteButtonInitial());

//   Future<void> favoriteButtonUpdated(String songId) async {
    
//     var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
//       params: songId
//     );
//     result.fold(
//       (l){},
//       (isFavorite){
//         emit(
//           FavoriteButtonUpdated(
//             isFavorite: isFavorite
//           )
//         );
//       },
//     );
//   }
// }