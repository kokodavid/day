import 'dart:developer';

import 'package:day/app_interceptor.dart';
import 'package:day/player/video_model.dart';
import 'package:day/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videoRepositoryProvider = Provider((ref) => VideoRepository());

class VideoRepository {
  final Dio _dio;

  VideoRepository() : _dio = Dio() {
    _dio.interceptors.add(AppInterceptor());
  }

  Future<List<VideoModel>> fetchVideo() async {
    try {
      List<Future<Response>> futures =
          List.generate(5, (_) => _dio.get(Strings.randomVideoUrl));

      List<Response> responses = await Future.wait(futures);

      List<VideoModel> videoList = responses.map((response) {
        return VideoModel.fromJson(response.data);
      }).toList();

      log('Fetched ${videoList.length} videos');

      return videoList;
    } catch (e) {
      throw Exception('Failed to Fetch data $e');
    }
  }
}
