// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:demo/common/widgets/appbar/app_bar.dart';
// import 'package:demo/domain/entities/song/song.dart';
// import 'package:demo/presentation/song_player/bloc/song_player_state.dart';

// // import '../../../common/widgets/favorite_button/favorite_button.dart';
// // import '../../../core/configs/constants/app_urls.dart';
// // import '../../../core/configs/theme/app_colors.dart';

// class SongPlayerPage extends StatelessWidget {
//   final SongEntity songEntity;
//   const SongPlayerPage({
//     required this.songEntity,
//     super.key
//   });

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: BasicAppBar(
//         title: const Text(
//           'Now playing',
//           style: TextStyle(
//             fontSize: 18
//           ),
//         ),
//         action: IconButton(
//           onPressed: (){},
//           icon: const Icon(
//             Icons.more_vert_rounded
//           )
//         ),
//       ),
//       body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(
//             vertical: 16,
//             horizontal: 16
//           ),
//           child: Builder(
//             builder: (context) {
//               return Column(
//                 children: [
//                   _songCover(context),
//                   const SizedBox(height: 20,),
//                   _songDetail(),
//                   const SizedBox(height: 30,),
//                   _songPlayer(context)
//                 ],
//               );
//             }
//           ),
//         ),
//       );
//   }

//   Widget _songCover(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height / 2,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: AssetImage(
            
//           )
//         )
//       ),
//     );
//   }

//   Widget _songDetail() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               songEntity.title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22
//               ),
//             ),
//             const SizedBox(height: 5, ),
//               Text(
//                 songEntity.artist,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14
//                 ),
//               ),
//           ],
//         ),
//           // FavoriteButton(
//           //   songEntity: songEntity
//           // )
//       ],
//     );
//   }

//   Widget _songPlayer(BuildContext context) {
//     return Column(
//             children: [
//               Slider(
//                 value: 0.1,
//                 min: 0.0,
//                 max: 2.0,
//                 onChanged: (value){}
//              ),
//              const SizedBox(height: 20,),
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
                  
//                 ),

//                 Text(
//                   // formatDuration(
//                   //   context.read<SongPlayerCubit>().songDuration
//                   // )
//                 )
//               ],
//              ),
//              const SizedBox(height: 20,),

//              GestureDetector(
//               onTap: (){
                
//               },
//                child: Container(
//                 height: 60,
//                 width: 60,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: AppColors.primary
//                 ),
//                 child: Icon(
//                   context.read<SongPlayerCubit>().audioPlayer.playing ? Icons.pause : Icons.play_arrow
//                 ),
//                ),
//              )
//             ],
//           );
//         }

//         return Container();
//       },
//     );
//   }

//   String formatDuration(Duration duration) {
//     final minutes = duration.inMinutes.remainder(60);
//     final seconds = duration.inSeconds.remainder(60);
//     return '${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}';
//   }
// }