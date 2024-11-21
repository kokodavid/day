import 'package:chewie/chewie.dart';
import 'package:day/player/video_model.dart';
import 'package:day/player/video_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final randomVideoProvider =
    FutureProvider.autoDispose<List<VideoModel>>((ref) async {
  return ref.read(videoRepositoryProvider).fetchVideo();
});

final videoControllerProvider =
    Provider.family.autoDispose<YoutubePlayerController, String>((ref, data) {
  final controller = YoutubePlayerController(
      initialVideoId: data, flags: const YoutubePlayerFlags(autoPlay: true));

  // ref.onDispose(() {
  //   controller.dispose();
  // });

  return controller;
});

final preloadNextVideoprovider = Provider.family<void,Map<String,dynamic>>((ref,data){
  final currentIndex = data['currentIndex'];
  final videos = data['videosList'];

  if(currentIndex + 1 < videos.length){
    final nextController = ref.read(videoControllerProvider(videos[currentIndex + 1].id));
    nextController.cue(videos[currentIndex + 1].id);
  }
});

final chewieControllerProvider =
    Provider.family<ChewieController, String>((ref, id) {
  final videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse('http://www.youtube.com/watch?v=$id'));
  return ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true);
});
