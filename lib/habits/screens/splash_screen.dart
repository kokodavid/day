import 'package:day/helpers/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 2),(){
      context.go('/home');
    });
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(gradient: GlobalThemeData.linearGradient),
        child: Center(
          child: SvgPicture.asset(
            'assets/logo.svg',
            height: 110,
          ),
        ),
      ),
    );
  }
}
