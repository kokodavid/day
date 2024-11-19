import 'dart:developer';

import 'package:day/player/video_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends ConsumerStatefulWidget {
  const VideoPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends ConsumerState<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    final videoData = ref.watch(randomVideoProvider);
    return Scaffold(
      body: videoData.when(
          data: (data) {
            log("Data video id received ${data.id}");
            return YoutubePlayer(
              controller: ref.read(videoControllerProvider(data.id)),
              showVideoProgressIndicator: false,
              progressIndicatorColor: Colors.amber,
              aspectRatio: 9/16,
              );
          },
          error: (e, s) {
            return Text('Error Occured $e,$s');
          },
          loading: () => const CircularProgressIndicator()),
    );
  }
}
