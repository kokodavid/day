import 'package:day/habits/helpers/storage_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Choose Data Storage")),
      body: Column(
        children: [
          ListTile(
            title: const Text("Store data on this device (Offline)"),
            leading: const Icon(Icons.storage),
            onTap: () async {
              await StoragePreference.setPreference("local");
              context.go('/home');
            },
          ),
          ListTile(
            title: const Text("Create an account to store data on the cloud (Supabase)"),
            leading: const Icon(Icons.cloud),
            onTap: () async {
              await StoragePreference.setPreference("cloud");
              context.go("/signUp");
            },
          ),
        ],
      ),
    );
  }
}