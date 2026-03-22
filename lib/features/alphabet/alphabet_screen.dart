import 'package:flutter/material.dart';

/// Alphabet learning screen
/// Goal:
/// - Show Sorani letters
/// - Tap → play audio
class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO:
    // Create a grid of letters
    // Each item should be tappable
    // On tap → play audio

    return Scaffold(
      appBar: AppBar(title: const Text('Alphabet')),
      body: const Center(
        child: Text('Alphabet goes here'),
      ),
    );
  }
}