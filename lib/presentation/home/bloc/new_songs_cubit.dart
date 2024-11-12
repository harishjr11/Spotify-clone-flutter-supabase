import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:demo/domain/usecases/song/get_new_songs.dart';
import 'package:demo/presentation/home/bloc/new_songs_state.dart';
import '../../../service_locator.dart';

class NewSongsCubit extends Cubit<NewSongsState> {
  NewSongsCubit() : super(NewSongsLoading());

  Future<void> getNewSongs() async {
    emit(NewSongsLoading()); // Emit loading state again

    // Call the use case to get new songs
    var returnedSongs = await sl<GetNewSongsUseCase>().call();

    returnedSongs.fold(
      (failure) {// Log failure
        emit(NewSongsLoadFailure()); // Emit failure state
      },
      (data) {// Log success
        emit(NewSongsLoaded(songs: data)); // Emit loaded state
      },
    );
  }
}
