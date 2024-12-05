import 'dart:developer';
import 'dart:typed_data';

import 'package:day/app_interceptor.dart';
import 'package:day/quotes/quotes_model.dart';
import 'package:day/helpers/utils/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quotesRepositoryProvider = Provider((ref) => QuotesRepository());

class QuotesRepository {
  final Dio _dio;

  QuotesRepository() : _dio = Dio() {
    _dio.interceptors.add(AppInterceptor());
  }

  Future<List<QuotesModel>> fetchQuotes() async {
    try {
      Response response = await _dio.get(Strings.quotesUrl);
      List<dynamic> data = response.data;
      return data.map((json) => QuotesModel.fromJson(json)).toList();
    } catch (e) {
      log('Error Fetching Quotes $e');
      rethrow;
    }
  }

  Future<Uint8List> fetchImages() async {
    try {
      Response response = await _dio.get(Strings.quoteImageUrl,
          options: Options(responseType: ResponseType.bytes));

      return response.data;
    } catch (e) {
      log('Error Fetching Images $e');
      rethrow;
    }
  }
}
