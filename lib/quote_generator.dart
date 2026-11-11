import 'package:flutter/material.dart';

import 'dart:math';

import 'styled_text.dart';

final randomizer = Random();

class QuoteGenerator extends StatefulWidget {
  const QuoteGenerator({super.key});

  @override
  State<QuoteGenerator> createState() {
    return _QuoteGeneratorState();
  }
}

class _QuoteGeneratorState extends State<QuoteGenerator> {
  final List<String> _quotes = [
    "Единственный способ делать великие дела — любить то, что вы делаете.",
    "Успех — это способность идти от неудачи к неудаче, не теряя энтузиазма.",
    "Ваше время ограничено, не тратьте его на чужую жизнь.",
    "Лучший способ предсказать будущее — создать его.",
  ];

  var _currentQuote = "Нажмите на кнопку, чтобы получить цитату!";
  var _activeImage = 'assets/images/quote-1.jpg';

  void generateQuote() {
    setState(() {
      _currentQuote = _quotes[randomizer.nextInt(_quotes.length)];
      _activeImage =
          'assets/images/quote-${randomizer.nextInt(9) + 1}.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(_activeImage, width: 250, height: 250),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StyledText(_currentQuote),
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: generateQuote,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text("Новая цитата"),
        ),
      ],
    );
  }
}
