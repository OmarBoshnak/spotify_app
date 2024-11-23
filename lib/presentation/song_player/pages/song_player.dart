import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoti_third/common/widgets/favorite_button.dart';
import 'package:spoti_third/core/configs/theme/app_color.dart';
import 'package:spoti_third/domain/song/entities/song_entities.dart';
import 'package:spoti_third/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spoti_third/presentation/song_player/bloc/song_player_state.dart';

import '../../../core/configs/constants/app_urls.dart';

class SongPlayer extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayer({
    super.key,
    required this.songEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            radius: 18,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Now playing',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
        ],
      ),
      body: BlocProvider(
        create: (context) => SongPlayerCubit()
          ..loadSong(
              '${AppURLs.songFirestorage}${Uri.encodeComponent(songEntity.artist)} - ${Uri.encodeComponent(songEntity.title)}.mp3?${AppURLs.mediaAlt}'),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: [
              _coverImage(context),
              SizedBox(
                height: 10,
              ),
              _songDetail(context),
              SizedBox(
                height: 20,
              ),
              _songPlayer(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _coverImage(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 2.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    '${AppURLs.coverFirestorage}${Uri.encodeComponent(songEntity.artist)} - ${Uri.encodeComponent(songEntity.title)}.jpg?${AppURLs.mediaAlt}'))),
      );
  Widget _songDetail(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(songEntity.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    )),
                Text(
                  songEntity.artist,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            FavoriteButton(songEntity: songEntity)
          ],
        ),
      );

  Widget _songPlayer(BuildContext context) =>
      BlocBuilder<SongPlayerCubit, SongPlayerState>(
        builder: (context, state) {
          if (state is SongPlayerLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SongPlayerLoaded) {
            return Column(
              children: [
                Slider(
                  activeColor: Colors.grey[700],
                  value: context
                      .read<SongPlayerCubit>()
                      .songPosition
                      .inSeconds
                      .toDouble(),
                  min: 0.0,
                  max: context
                      .read<SongPlayerCubit>()
                      .songDuration
                      .inSeconds
                      .toDouble(),
                  onChanged: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          formatDuration(
                              context.read<SongPlayerCubit>().songPosition),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                      Text(
                          formatDuration(
                              context.read<SongPlayerCubit>().songDuration),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<SongPlayerCubit>().playOrPauseSong();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primary,
                    ),
                    child: Icon(
                      context.read<SongPlayerCubit>().audioPlayer.playing
                          ? Icons.pause
                          : Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            );
          }
          return Container();
        },
      );
  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
