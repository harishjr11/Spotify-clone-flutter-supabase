import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demo/core/configs/constants/app_urls.dart';
import 'package:demo/domain/entities/song/song.dart';
import 'package:demo/presentation/home/bloc/new_songs_cubit.dart';
import 'package:demo/presentation/home/bloc/new_songs_state.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BlocBuilder<NewSongsCubit, NewSongsState>(
        builder: (context, state) {
          if (state is NewSongsLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          if (state is NewSongsLoaded) {
            return _songs(state.songs);
          }

          if (state is NewSongsLoadFailure) {
            return const Center(
              child: Text('Failed to load songs'),
            );
          }

          return Container(); // Default case
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final song = songs[index];
        final imageUrl = '${AppUrls.firestorage}${song.title}.jpg'; // Construct image URL

        return SizedBox(
          width: 160,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(song.title),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 14),
      itemCount: songs.length,
    );
  }
}
