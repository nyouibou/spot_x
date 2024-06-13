// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';
import 'package:spot_x/presentation/home_page/view/song_page.dart';
import 'package:spot_x/presentation/home_page/view/widgets/custom_listed_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  SongDataController songDataController = Get.put(SongDataController());
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Music",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: DefaultTabController(
                length: 4, // Number of tabs
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          child: Text(
                            "Library",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Artists",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Albums",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Folders",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Content for the "Songs" tab
                          SingleChildScrollView(
                            child: Column(
                              children: songDataController.songList.value
                                  .map(
                                    (e) => CustomListedPage(
                                      songName: e.title,
                                      artist: e.artist!,
                                      onPressed: () {
                                        songPlayerController.playLocalAudio(e);
                                        songDataController.currentIndex(e.id);
                                        Get.to(() => SongPageScreen());
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          // Content for the "Artists" tab
                          Container(
                            child: Center(
                              child: Text(
                                "Artists",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          // Content for the "Albums" tab
                          Container(
                            child: Center(
                              child: Text(
                                "Albums",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          // Content for the "Folders" tab
                          Container(
                            child: Center(
                              child: Text(
                                "Folders",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Mini player
            Container(
              color: Colors.grey[900],
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          songPlayerController.songTitle.value,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          songPlayerController.songArtist.value,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Add onPressed function for mini player button
                    },
                    icon: Icon(
                      Icons.play_circle_filled,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
