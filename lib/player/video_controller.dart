import 'package:day/player/video_model.dart';
import 'package:day/player/video_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final randomVideoProvider = FutureProvider.autoDispose<VideoModel>((ref) async {
  final result = ref.read(videoRepositoryProvider).fetchVideo();
  return result;
});

final videoControllerProvider = Provider.family<YoutubePlayerController,String>((ref,data) {
  return YoutubePlayerController(
      initialVideoId: data,
      flags: const YoutubePlayerFlags(autoPlay: true));
});
