// ignore_for_file: avoid_print, invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spot_x/presentation/home_page/controller/song_player_controller.dart';

class SongDataController extends GetxController {
  SongPlayerController songPlayerController = Get.put(SongPlayerController());

  final audioQuery = OnAudioQuery();

  RxList<SongModel> songList = <SongModel>[].obs;
  RxBool isDeviceSongs = true.obs;
  RxInt currentSongIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    storagePermission();
  }

  void getLocalSongs() async {
    songList.value = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL);
    print(songList.value);
  }

  Future<void> storagePermission() async {
    try {
      var permission = await Permission.storage.request();
      if (permission.isGranted) {
        print("permission granted");
        getLocalSongs();
      } else {
        print("permission denied");
        Permission.storage.request();
      }
    } catch (exception) {
      print(exception);
    }
  }

  void currentIndex(int songId) {
    var index = 0;
    songList.forEach((element) {
      if (element.id == songId) {
        currentSongIndex.value = index;
      }
      index++;
    });
    print(songId);
  }

  void nextSongPlay() {
    int len = songList.length;
    currentSongIndex.value = currentSongIndex.value + 1;

    if (currentSongIndex.value < len) {
      SongModel next = songList[currentSongIndex.value];
      songPlayerController.playLocalAudio(next);
    }
  }

  void previousSongPlay() {
    //int len = songList.length;
    currentSongIndex.value = currentSongIndex.value - 1;
    SongModel previous = songList[currentSongIndex.value];
    songPlayerController.playLocalAudio(previous);
  }
}
