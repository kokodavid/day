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

  Future<VideoModel> fetchVideo() async {
    try {
      Response response = await _dio.get(Strings.randomVideoUrl);
      return VideoModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to Fetch data $e');
    }
  }
}
