// import 'package:get/state_manager.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:on_audio_query/on_audio_query.dart';

// class SongPlayerController extends GetxController {
//   final player = AudioPlayer();
//   RxBool isPlaying = false.obs;
//   RxDouble sliderValue = 0.0.obs;
//   RxString songTitle = "".obs;
//   RxString songArtist = "".obs;

//   Future<void> playLocalAudio(SongModel song) async {
//     songTitle.value = song.title;
//     songArtist.value = song.artist!;
//     await player.setAudioSource(AudioSource.uri(Uri.parse(song.data)));
//     player.play();
//     isPlaying.value = true;
//   }

//   Future<void> resumePlaying() async {
//     isPlaying.value = true;
//     await player.play();
//   }

//   Future<void> pausePlaying() async {
//     isPlaying.value = false;
//     await player.pause();
//   }
// }
import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongPlayerController extends GetxController {
  final player = AudioPlayer();
  RxBool isPlaying = false.obs;
  RxDouble sliderValue = 0.0.obs;
  RxString songTitle = "".obs;
  RxString songArtist = "".obs;
  Rx<Duration> songDuration = Duration.zero.obs;
  Rx<Duration> currentPosition = Duration.zero.obs;

  @override
  void onInit() {
    super.onInit();

    // Listen to the position stream of the player
    player.positionStream.listen((position) {
      sliderValue.value = position.inSeconds.toDouble();
      currentPosition.value = position;
    });

    // Listen to the duration stream of the player
    player.durationStream.listen((duration) {
      songDuration.value = duration ?? Duration.zero;
    });

    // Listen to the player state changes
    player.playerStateStream.listen((playerState) {
      isPlaying.value = playerState.playing;
    });
  }

  Future<void> playLocalAudio(SongModel song) async {
    songTitle.value = song.title;
    songArtist.value = song.artist ?? '';
    await player.setAudioSource(AudioSource.uri(Uri.parse(song.data)));
    player.play();
    isPlaying.value = true;
  }

  Future<void> resumePlaying() async {
    isPlaying.value = true;
    await player.play();
  }

  Future<void> pausePlaying() async {
    isPlaying.value = false;
    await player.pause();
  }

  Future<void> seekToPosition(Duration position) async {
    await player.seek(position);
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
