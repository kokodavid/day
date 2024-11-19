
import 'package:chewie/chewie.dart';
import 'package:day/player/video_model.dart';
import 'package:day/player/video_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final randomVideoProvider = FutureProvider.autoDispose<VideoModel>((ref) async {
  return ref.read(videoRepositoryProvider).fetchVideo();
});

final videoControllerProvider = Provider.family.autoDispose<YoutubePlayerController,String>((ref,data) {
  return YoutubePlayerController(
      initialVideoId: data,
      flags: const YoutubePlayerFlags(autoPlay: true));
});


final chewieControllerProvider = Provider.family<ChewieController,String>((ref,id){
final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
    'http://www.youtube.com/watch?v=$id'));
      return ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true
        );
});
