import 'package:day/player/video_list_notifier.dart';
import 'package:day/player/video_model.dart';
import 'package:day/player/video_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final currentVideoIndexProvider = StateProvider<int>((ref) => 0);

final preloadedControllerProvider =
    StateProvider<Map<String, YoutubePlayerController>>((ref) => {});

final randomVideoProvider =
    FutureProvider.autoDispose<List<VideoModel>>((ref) async {
  return ref.read(videoRepositoryProvider).fetchVideo();
});

final videoControllerProvider = Provider.family
    .autoDispose<YoutubePlayerController, String>((ref, videoId) {
  final preloadedControllers = ref.read(preloadedControllerProvider);

  if (preloadedControllers.containsKey(videoId)) {
    final controller = preloadedControllers[videoId]!;

    Future.microtask(() {
      ref.read(preloadedControllerProvider.notifier).state = {
        ...preloadedControllers,
      }..remove(videoId);
    });

    return controller;
  }

  return YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, hideThumbnail: true));
  
});

final preloadNextVideoProvider = Provider.family<void, int>((ref, currentIndex) {
  final videos = ref.watch(videoListProvider);
  if (currentIndex + 1 >= videos.length - 1) {
    ref.read(videoListProvider.notifier).loadMoreVideos();
  }

  if (currentIndex == 3) {
    ref.read(videoListProvider.notifier).trimList(currentIndex);
  }

  if (currentIndex + 1 < videos.length) {
    final nextVideo = videos[currentIndex + 1];
    final preloadedControllers = ref.read(preloadedControllerProvider);

    if (!preloadedControllers.containsKey(nextVideo.id)) {
      Future.microtask(() {
        final nextController = ref.read(videoControllerProvider(nextVideo.id));

        nextController
          ..cue(nextVideo.id)
          ..pause();

        ref.read(preloadedControllerProvider.notifier).state = {
          ...preloadedControllers,
          nextVideo.id: nextController,
        };
      });
    }
  }
});

final cleanupControllersProvider = Provider<void>((ref) {
  ref.onDispose(() {
    final preloadedControllers = ref.read(preloadedControllerProvider);
    for (final controller in preloadedControllers.values) {
      controller.dispose();
    }
  });
});
