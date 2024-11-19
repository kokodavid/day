import 'package:day/quotes/quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuotesWidget extends ConsumerWidget {
  const QuotesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getQuotesProvider);
    final image = ref.watch(imageQuotesProvider);

    return Scaffold(
        body: image.when(
            data: (data) {
              return Center(child: Image.memory(data));
            },
            error: (e, s) {
              return Text('$e and $s');
            },
            loading: () => const CircularProgressIndicator()));
  }
}
