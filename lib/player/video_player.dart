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
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            controller: pageController,
            onPageChanged: (index) => ref.refresh(randomVideoProvider),
            itemBuilder: (context, index) {
              final videoData = ref.watch(randomVideoProvider);
              return videoData.when(
                  data: (data) {
                    log("Data video id received ${data.id}");
                    return YoutubePlayer(
                        controller: ref.read(videoControllerProvider(data.id)),
                        showVideoProgressIndicator: false,
                        progressIndicatorColor: Colors.amber,
                        aspectRatio: 9 / 16,
                        onEnded: (metadata) {
                            pageController.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.easeInOut);
                          
                          final nextVideo = ref.refresh(randomVideoProvider);
                        });
                  },
                  error: (e, s) {
                    return Text('Error Occured $e,$s');
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()));
            }));
  }
}
