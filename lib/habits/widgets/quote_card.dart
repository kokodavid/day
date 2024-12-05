import 'package:day/quotes/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuoteCard extends ConsumerWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(imageQuotesProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: image.when(
        data: (data) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.memory(
              data,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          );
        },
        error: (e, s) {
          return Text('$e and $s');
        },
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}