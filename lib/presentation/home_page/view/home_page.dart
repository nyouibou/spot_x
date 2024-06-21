// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_protected_member, avoid_unnecessary_containers
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:spot_x/core/constants/color.dart';
// import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
// import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';
// import 'package:spot_x/presentation/home_page/view/song_page.dart';
// import 'package:spot_x/presentation/home_page/view/widgets/custom_listed_page.dart';
// import 'package:spot_x/presentation/miniplayerscreen/miniplayerscreen.dart';

// class HomePageScreen extends StatefulWidget {
//   const HomePageScreen({super.key});

//   @override
//   State<HomePageScreen> createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends State<HomePageScreen> {
//   final SongDataController songDataController = Get.put(SongDataController());
//   final SongPlayerController songPlayerController =
//       Get.put(SongPlayerController());

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ColorConstants.customBlack2,
//         appBar: AppBar(
//           title: Text(
//             "Music",
//             style: TextStyle(color: Colors.white),
//           ),
//           backgroundColor: Colors.transparent,
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.search,
//                 color: Colors.white,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.more_vert,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: DefaultTabController(
//                 length: 2,
//                 child: Column(
//                   children: [
//                     TabBar(
//                       dividerColor: Colors.transparent,
//                       indicatorColor: Colors.red,
//                       indicatorSize: TabBarIndicatorSize.label,
//                       unselectedLabelColor: Colors.grey,
//                       tabs: [
//                         Tab(
//                           child: Text(
//                             "Library",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         Tab(
//                           child: Text(
//                             "Favorites",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         children: [
//                           // Content for the "Library" tab
//                           Obx(
//                             () {
//                               if (songDataController.songList.isEmpty) {
//                                 return Center(
//                                   child: Text(
//                                     "No songs found",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 );
//                               }
//                               return SingleChildScrollView(
//                                 child: Column(
//                                   children: songDataController.songList.value
//                                       .map(
//                                         (e) => CustomListedPage(
//                                           songName: e.title,
//                                           artist: e.artist ?? 'Unknown Artist',
//                                           onPressed: () {
//                                             songPlayerController
//                                                 .playLocalAudio(e);
//                                             songDataController
//                                                 .currentIndex(e.id);
//                                             Get.to(() => SongPageScreen());
//                                           },
//                                         ),
//                                       )
//                                       .toList(),
//                                 ),
//                               );
//                             },
//                           ),
//                           // Content for the "Artists" tab
//                           Container(
//                             child: Center(
//                               child: Text(
//                                 "Favorites",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       // Wrap the MiniAudioPlayer with GestureDetector
//                       onTap: () {
//                         // Navigate to SongPageScreen when tapped
//                         Get.to(() => SongPageScreen());
//                       },
//                       child: Obx(
//                         () => songPlayerController.isPlaying.value
//                             ? MiniAudioPlayer(
//                                 songPlayerController: songPlayerController,
//                                 songDataController: songDataController,
//                               )
//                             : SizedBox.shrink(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spot_x/core/constants/color.dart';
import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';
import 'package:spot_x/presentation/home_page/view/song_page.dart';
import 'package:spot_x/presentation/home_page/view/widgets/custom_listed_page.dart';
import 'package:spot_x/presentation/miniplayerscreen/miniplayerscreen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final SongDataController songDataController = Get.put(SongDataController());
  final SongPlayerController songPlayerController =
      Get.put(SongPlayerController());

  bool showMiniPlayer = false;

  @override
  void initState() {
    super.initState();
    // Listen to changes in isPlaying value to update showMiniPlayer
    ever(songPlayerController.isPlaying, (_) {
      setState(() {
        showMiniPlayer = songPlayerController.isPlaying.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.customBlack2,
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
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      dividerColor: Colors.transparent,
                      indicatorColor: Colors.red,
                      indicatorSize: TabBarIndicatorSize.label,
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
                            "Favorites",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          // Content for the "Library" tab
                          Obx(
                            () {
                              if (songDataController.songList.isEmpty) {
                                return Center(
                                  child: Text(
                                    "No songs found",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                              return SingleChildScrollView(
                                child: Column(
                                  children: songDataController.songList.value
                                      .map(
                                        (e) => CustomListedPage(
                                          songName: e.title,
                                          artist: e.artist ?? 'Unknown Artist',
                                          onPressed: () {
                                            songPlayerController
                                                .playLocalAudio(e);
                                            songDataController
                                                .currentIndex(e.id);
                                            Get.to(() => SongPageScreen());
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              );
                            },
                          ),
                          // Content for the "Favorites" tab
                          Container(
                            child: Center(
                              child: Text(
                                "Favorites",
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
            // Show MiniAudioPlayer conditionally
            if (showMiniPlayer)
              GestureDetector(
                onTap: () {
                  Get.to(() => SongPageScreen());
                },
                child: MiniAudioPlayer(
                  songPlayerController: songPlayerController,
                  songDataController: songDataController,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
