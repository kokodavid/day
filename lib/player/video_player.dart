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
    final videoData = ref.watch(randomVideoProvider);
    return Scaffold(
        body: videoData.when(
            data: (videos) => PageView.builder(
                scrollDirection: Axis.vertical,
                controller: pageController,
                onPageChanged: (index) {
                  final dataMap = {'videosList': videos, 'currentIndex': index};

                  if (index + 1 < videos.length) {
                    return ref.read(preloadNextVideoprovider(dataMap));
                  }
                },
                itemBuilder: (context, index) {
                  if (index >= videos.length) {
                    return const Center(
                      child: Text('No more videos'),
                    );
                  }
                  final video = videos[index];
                  final controller =
                      ref.read(videoControllerProvider(video.id));

                      if (index == 0){
                        WidgetsBinding.instance.addPostFrameCallback((_){
                          ref.read(preloadNextVideoprovider({'videosList':videos,'currentIndex':index}));
                        });
                      }
                  return YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                      aspectRatio: 9 / 16,
                      onEnded: (metadata) {
                        pageController.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeInOut);
                      });
                }),
            error: (e, s) {
              return Text('Error Occured $e,$s');
            },
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
