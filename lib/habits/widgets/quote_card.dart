import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage('https://pqvzwgqnwxhtwcrdubah.supabase.co/storage/v1/object/sign/assets/777851.jpg?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJhc3NldHMvNzc3ODUxLmpwZyIsImlhdCI6MTczMzAzNDE3MywiZXhwIjoxNzY0NTcwMTczfQ._9rTn1ZXm3gn63e27-HioO5j-wK4zh1hK6CpjcKnCy8&t=2024-12-01T06%3A22%3A53.939Z'),
          fit: BoxFit.cover,
        ),
      ),
      child: const SizedBox(
        height: 120,
        child: Center(
          child: Text(
            '"The idea of ourselves is our escape from\nthe fact of what we really are."',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}