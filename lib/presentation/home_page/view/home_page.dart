// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, invalid_use_of_protected_member

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:spot_x/core/constants/color.dart';
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
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )),
            ],
          ),
          // appBar: AppBar(
          // bottom: TabBar(tabs: [
          //   Tab(
          //     child: Text("Songs"),
          //   ),
          //   Tab(
          //     child: Text("Artist"),
          //   ),
          //   Tab(
          //     child: Text("Album"),
          //   ),
          //   Tab(
          //     child: Text("Folder"),
          //   ),
          // ]),
          //backgroundColor: Colors.grey,
          // title: Text("My Music"),
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.account_circle),
          //   ),
          // ],
          // ),
          body: Column(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   height: 50,
                            //   // width: MediaQuery.sizeOf(context).width,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8),
                            //       color:
                            //           const Color.fromARGB(255, 145, 143, 143)),
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         height: 50,
                            //         width: 200,
                            //         // color: Colors.amber,
                            //         margin:
                            //             EdgeInsets.symmetric(horizontal: 20),
                            //         child: TextFormField(
                            //           decoration: InputDecoration(
                            //               hintText: "Search the Music...",
                            //               border: InputBorder.none),
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 15),
                            //         child: IconButton(
                            //             onPressed: () {},
                            //             icon: Icon(Icons.search)),
                            //       )
                            //     ],
                            //   ),
                            // ),

                            Obx(
                              () => Row(
                                children: [
                                  // TextButton(
                                  //   onPressed: () {
                                  //     songDataController.isDeviceSongs.value =
                                  //         false;
                                  //   },
                                  //   child: Text(
                                  //     "Cloud Songs",
                                  //     style: GoogleFonts.nunitoSans(
                                  //         textStyle: TextStyle(
                                  //             fontSize: 20,
                                  //             fontWeight: FontWeight.w400,
                                  //             color: songDataController
                                  //                     .isDeviceSongs.value
                                  //                 ? ColorConstants.customGrey
                                  //                 : ColorConstants
                                  //                     .customWhite)),
                                  //   ),
                                  // ),
                                  TextButton(
                                    onPressed: () {
                                      songDataController.isDeviceSongs.value =
                                          true;
                                    },
                                    child: Text(
                                      "Library",
                                      style: GoogleFonts.nunitoSans(
                                          textStyle: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: songDataController
                                                      .isDeviceSongs.value
                                                  ? ColorConstants.customWhite
                                                  : ColorConstants
                                                      .customGrey3)),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Obx(
                                    () => songDataController.isDeviceSongs.value
                                        ? Column(
                                            children: songDataController
                                                .songList.value
                                                .map((e) => CustomListedPage(
                                                      songName: e.title,
                                                      artist: e.artist!,
                                                      onPressed: () {
                                                        songPlayerController
                                                            .playLocalAudio(e);

                                                        songDataController
                                                            .currentIndex(e.id);

                                                        Get.to(() => SongPageScreen(
                                                            // songName: e.title,
                                                            // songArtist: e.artist!,
                                                            ));
                                                      },
                                                    ))
                                                .toList(),
                                          )
                                        : Column(
                                            children: [
                                              //CustomListedPage(),
                                            ],
                                          )))
                          ]),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
