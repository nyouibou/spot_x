// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:lottie/lottie.dart';
// import 'package:spot_x/core/constants/color.dart';
// import 'package:spot_x/core/constants/texts.dart';
// import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
// import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';

// class SongPageScreen extends StatefulWidget {
//   const SongPageScreen({
//     super.key,
//   });

//   @override
//   State<SongPageScreen> createState() => _SongPageScreenState();
// }

// class _SongPageScreenState extends State<SongPageScreen>
//     with SingleTickerProviderStateMixin {
//   SongPlayerController songPlayerController = Get.put(SongPlayerController());
//   SongDataController songDataController = Get.put(SongDataController());

//   late AnimationController aniController;
//   late LottieComposition lotComposition;

//   @override
//   void initState() {
//     super.initState();
//     aniController = AnimationController(vsync: this);
//     songPlayerController.isPlaying.listen((isPlaying) {
//       if (isPlaying) {
//         aniController.forward();
//       } else {
//         aniController.stop();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Stack(children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   height: MediaQuery.sizeOf(context).height / 1.8,
//                   width: MediaQuery.sizeOf(context).width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Lottie.asset(controller: aniController,
//                       onLoaded: (composition) {
//                     aniController.duration = composition.duration;
//                     aniController.repeat();
//                   }, 'assets/images/Animation - 1716911199498.json',
//                       fit: BoxFit.fill),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Obx(
//                   () => Text(
//                     songPlayerController.songTitle.value,
//                     style: MytextStyle.customWhiteHeadings,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Obx(
//                   () => Text(
//                     songPlayerController.songArtist.value,
//                     style: MytextStyle.customWhiteHeadings1,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Obx(
//                   () => Slider(
//                     inactiveColor: ColorConstants.customWhite,
//                     activeColor: ColorConstants.customBlack1,
//                     value: songPlayerController.sliderValue.value,
//                     onChanged: (value) {
//                       songPlayerController.sliderValue.value = value;
//                     },
//                     min: 0,
//                     max: 100,
//                   ),
//                 ),

//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.shuffle,
//                             size: 40,
//                             color: Colors.white,
//                           )),
//                       IconButton(
//                           onPressed: () {
//                             songDataController.previousSongPlay();
//                           },
//                           icon: Icon(Icons.arrow_back_ios_rounded,
//                               size: 40, color: Colors.white)),
//                       Obx(
//                         () => songPlayerController.isPlaying.value
//                             ? InkWell(
//                                 onTap: () {
//                                   songPlayerController.pausePlaying();
//                                   aniController.stop();
//                                 },
//                                 child: CircleAvatar(
//                                     radius: 30,
//                                     backgroundColor: Colors.white,
//                                     child: Icon(
//                                       Icons.pause,
//                                       color: Colors.black,
//                                       size: 40,
//                                     )),
//                               )
//                             : InkWell(
//                                 onTap: () {
//                                   songPlayerController.resumePlaying();
//                                   aniController.repeat();
//                                 },
//                                 child: CircleAvatar(
//                                     radius: 30,
//                                     backgroundColor: Colors.white,
//                                     child: Icon(
//                                       Icons.play_arrow,
//                                       color: Colors.black,
//                                       size: 40,
//                                     )),
//                               ),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             songDataController.nextSongPlay();
//                           },
//                           icon: Icon(Icons.arrow_forward_ios_rounded,
//                               size: 40, color: Colors.white)),
//                       IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.favorite_outline,
//                               size: 40, color: Colors.white))
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Positioned(
//             // left: 3,
//             top: 6,
//             child: CircleAvatar(
//               radius: 25,
//               backgroundColor: Colors.transparent,
//               child: IconButton(
//                   color: ColorConstants.customWhite,
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     size: 30,
//                   )),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:spot_x/core/constants/color.dart';
import 'package:spot_x/core/constants/texts.dart';
import 'package:spot_x/presentation/home_page/controller/song_data_controller.dart';
import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';

class SongPageScreen extends StatefulWidget {
  const SongPageScreen({
    super.key,
  });

  @override
  State<SongPageScreen> createState() => _SongPageScreenState();
}

class _SongPageScreenState extends State<SongPageScreen>
    with SingleTickerProviderStateMixin {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());
  SongDataController songDataController = Get.put(SongDataController());

  late AnimationController aniController;

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(vsync: this);
    songPlayerController.isPlaying.listen((isPlaying) {
      if (isPlaying) {
        aniController.repeat();
      } else {
        aniController.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 1.8,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Lottie.asset(
                    'assets/images/Animation - 1716911199498.json',
                    controller: aniController,
                    onLoaded: (composition) {
                      aniController.duration = composition.duration;
                      aniController.repeat();
                    },
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Obx(
                  () => Text(
                    songPlayerController.songTitle.value,
                    style: MytextStyle.customWhiteHeadings,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Obx(
                  () => Text(
                    songPlayerController.songArtist.value,
                    style: MytextStyle.customWhiteHeadings1,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Obx(
                  () => Slider(
                    inactiveColor: ColorConstants.customWhite,
                    activeColor: ColorConstants.customBlack1,
                    value: songPlayerController.sliderValue.value,
                    onChanged: (value) {
                      songPlayerController
                          .seekToPosition(Duration(seconds: value.toInt()));
                    },
                    min: 0,
                    max: songPlayerController.songDuration.value.inSeconds
                        .toDouble(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        songPlayerController.formatDuration(
                            songPlayerController.currentPosition.value),
                        style: MytextStyle.customWhiteHeadings1,
                      ),
                    ),
                    Obx(
                      () => Text(
                        songPlayerController.formatDuration(
                            songPlayerController.songDuration.value),
                        style: MytextStyle.customWhiteHeadings1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shuffle,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          songDataController.previousSongPlay();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      Obx(
                        () => songPlayerController.isPlaying.value
                            ? InkWell(
                                onTap: () {
                                  songPlayerController.pausePlaying();
                                  aniController.stop();
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.pause,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  songPlayerController.resumePlaying();
                                  aniController.repeat();
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          songDataController.nextSongPlay();
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 6,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: IconButton(
                color: ColorConstants.customWhite,
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
