import 'dart:developer';

import 'package:day/player/video_controller.dart';
import 'package:day/player/video_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends ConsumerStatefulWidget {
  const VideoPlayer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends ConsumerState<VideoPlayer> {
  late PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoList = ref.watch(videoListProvider);

    if (videoList.isEmpty) {
      ref.read(videoListProvider.notifier).initializeVideos();
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) {
            ref.read(currentVideoIndexProvider.notifier).state = index;
            ref.read(preloadNextVideoProvider(index));
          },
          itemBuilder: (context, index) {
            if (index >= videoList.length) {
              return const Center(
                child: Text('No more videos'),
              );
            }

            final video = videoList[index];
            final controller = ref.read(videoControllerProvider(video.id));

            return YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              aspectRatio: 9 / 16,
              onReady: () {
                controller.play();
              },
              onEnded: (metadata) {
                controller.pause();
              },
            );
          },
        ),
      ),
    );
  }
}
