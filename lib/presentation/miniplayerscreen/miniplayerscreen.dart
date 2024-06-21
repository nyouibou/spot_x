// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_x/core/constants/color.dart';
import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';

class MiniAudioPlayer extends StatelessWidget {
  final SongPlayerController songPlayerController;
  final SongDataController songDataController;

  MiniAudioPlayer(
      {required this.songPlayerController, required this.songDataController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90, // Adjust height as needed
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: ColorConstants.customBlack,
      ),
      child: Row(
        children: [
          // Album art
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
                "assets/images/Iphone.jpeg"), // Replace with actual URL
          ),
          SizedBox(width: 10),
          // Song title and artist
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    songPlayerController.songTitle.value,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Obx(
                  () => Text(
                    songPlayerController.songArtist.value,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          // Control buttons
          IconButton(
            onPressed: () {
              songDataController.previousSongPlay();
            },
            icon: Icon(
              Icons.skip_previous,
              color: Colors.white,
            ),
          ),
          Obx(
            () => IconButton(
              onPressed: () {
                if (songPlayerController.isPlaying.value) {
                  songPlayerController.pausePlaying();
                } else {
                  songPlayerController.resumePlaying();
                }
              },
              icon: Icon(
                songPlayerController.isPlaying.value
                    ? Icons.pause
                    : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              songDataController.nextSongPlay();
            },
            icon: Icon(
              Icons.skip_next,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
