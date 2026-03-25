import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/services.dart';

/// Alphabet learning screen
/// Goal:
/// - Show Sorani letters
/// - Tap to play audio
class AlphabetScreen extends StatelessWidget {
  AlphabetScreen({super.key});

  final player = AudioPlayer();

  static const List<String> _letters = <String>['ا', 'ب', 'پ', 'ت', 'ج', 'چ'];

  Future<void> _onLetterTap(BuildContext context, String letter) async {
    print('Tapped letter: $letter');

    await player.setUrl(
      'https://www.soundjay.com/buttons/sounds/button-09.mp3',
    );

    await player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alphabet')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _letters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          final String letter = _letters[index];
          return Material(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                _onLetterTap(context, letter);
                },
              child: Center(
                child: Text(
                  letter,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}