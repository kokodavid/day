import 'package:day/player/video_model.dart';
import 'package:day/player/video_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videoListProvider = StateNotifierProvider<VideoListNotifier,List<VideoModel>>((ref) => VideoListNotifier(ref));

class VideoListNotifier extends StateNotifier<List<VideoModel>>{
  final Ref ref;

  VideoListNotifier(this.ref): super([]);

  Future<void> initializeVideos()async{
    final initialVideos = await ref.read(videoRepositoryProvider).fetchVideo();
    state = initialVideos;
  }

  Future<void> loadMoreVideos() async{
    final additionalVideos = await ref.read(videoRepositoryProvider).fetchVideo();
    state = [...state,...additionalVideos];
  }

  void trimList(int currentIndex){
    if(currentIndex >= 3){
      state = state.skip(currentIndex - 3).toList();
    }
  }


}