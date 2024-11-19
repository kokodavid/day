import 'dart:typed_data';

import 'package:day/quotes/quotes_model.dart';
import 'package:day/quotes/quotes_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getQuotesProvider =
    FutureProvider.autoDispose<List<QuotesModel>>((ref) async {
  final response = await ref.read(quotesRepositoryProvider).fetchQuotes();
  return response;
});

final imageQuotesProvider = FutureProvider.autoDispose<Uint8List>((ref) async {
  final response = await ref.read(quotesRepositoryProvider).fetchImages();
  return response;
});
