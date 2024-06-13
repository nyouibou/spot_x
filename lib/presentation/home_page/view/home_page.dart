// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_protected_member

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:spot_x/core/constants/color.dart';
// import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
// import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';
// import 'package:spot_x/presentation/home_page/view/song_page.dart';
// import 'package:spot_x/presentation/home_page/view/widgets/custom_listed_page.dart';

// class HomePageScreen extends StatefulWidget {
//   const HomePageScreen({super.key});

//   @override
//   State<HomePageScreen> createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends State<HomePageScreen> {
//   SongDataController songDataController = Get.put(SongDataController());
//   SongPlayerController songPlayerController = Get.put(SongPlayerController());
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             title: Text(
//               "Music",
//               style: TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Colors.transparent,
//             actions: [
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.search,
//                     color: Colors.white,
//                   )),
//               IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.more_vert,
//                     color: Colors.white,
//                   )),
//             ],
//           ),
//           // appBar: AppBar(
//           // bottom: TabBar(tabs: [
//           //   Tab(
//           //     child: Text("Songs"),
//           //   ),
//           //   Tab(
//           //     child: Text("Artist"),
//           //   ),
//           //   Tab(
//           //     child: Text("Album"),
//           //   ),
//           //   Tab(
//           //     child: Text("Folder"),
//           //   ),
//           // ]),
//           //backgroundColor: Colors.grey,
//           // title: Text("My Music"),
//           // actions: [
//           //   IconButton(
//           //     onPressed: () {},
//           //     icon: Icon(Icons.account_circle),
//           //   ),
//           // ],
//           // ),
//           body: Column(
//             children: [
//               Expanded(
//                 child: Center(
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     child: SingleChildScrollView(
//                       physics: AlwaysScrollableScrollPhysics(),
//                       scrollDirection: Axis.vertical,
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Container(
//                             //   height: 50,
//                             //   // width: MediaQuery.sizeOf(context).width,
//                             //   decoration: BoxDecoration(
//                             //       borderRadius: BorderRadius.circular(8),
//                             //       color:
//                             //           const Color.fromARGB(255, 145, 143, 143)),
//                             //   child: Row(
//                             //     children: [
//                             //       Container(
//                             //         height: 50,
//                             //         width: 200,
//                             //         // color: Colors.amber,
//                             //         margin:
//                             //             EdgeInsets.symmetric(horizontal: 20),
//                             //         child: TextFormField(
//                             //           decoration: InputDecoration(
//                             //               hintText: "Search the Music...",
//                             //               border: InputBorder.none),
//                             //         ),
//                             //       ),
//                             //       Padding(
//                             //         padding: const EdgeInsets.symmetric(
//                             //             horizontal: 15),
//                             //         child: IconButton(
//                             //             onPressed: () {},
//                             //             icon: Icon(Icons.search)),
//                             //       )
//                             //     ],
//                             //   ),
//                             // ),

//                             Obx(
//                               () => Row(
//                                 children: [
//                                   TextButton(
//                                     onPressed: () {
//                                       songDataController.isDeviceSongs.value =
//                                           true;
//                                     },
//                                     child: Text(
//                                       "Library",
//                                       style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.w400,
//                                               color: songDataController
//                                                       .isDeviceSongs.value
//                                                   ? ColorConstants.customWhite
//                                                   : ColorConstants.customGrey3)),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),

//                             Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 4),
//                                 child: Obx(
//                                     () => songDataController.isDeviceSongs.value
//                                         ? Column(
//                                             children: songDataController
//                                                 .songList.value
//                                                 .map((e) => CustomListedPage(
//                                                       songName: e.title,
//                                                       artist: e.artist!,
//                                                       onPressed: () {
//                                                         songPlayerController
//                                                             .playLocalAudio(e);

//                                                         songDataController
//                                                             .currentIndex(e.id);

//                                                         Get.to(() => SongPageScreen(
//                                                             // songName: e.title,
//                                                             // songArtist: e.artist!,
//                                                             ));
//                                                       },
//                                                     ))
//                                                 .toList(),
//                                           )
//                                         : Column(
//                                             children: [
//                                               //CustomListedPage(),
//                                             ],
//                                           )))
//                           ]),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';
import 'package:spot_x/presentation/home_page/view/song_page.dart';
import 'package:spot_x/presentation/home_page/view/widgets/custom_listed_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

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
                      dividerColor: Colors.transparent,
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
          ],
        ),
      ),
    );
  }
}
