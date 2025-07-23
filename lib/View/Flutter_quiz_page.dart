import 'package:flashquiz/DataLayer/flutter_mcqs.dart';
import 'package:flashquiz/Model/flash_card_model.dart';
import 'package:flashquiz/View/result.dart';
import 'package:flutter/material.dart';

class FlutterQuizPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkTheme;

  FlutterQuizPage({required this.onThemeToggle, required this.isDarkTheme});

  @override
  _FlutterQuizPageState createState() => _FlutterQuizPageState();
}

class _FlutterQuizPageState extends State<FlutterQuizPage> {
  int currentIndex = 0;
  String? selectedOption;
  int score = 0;
  bool showCorrectAnswer = false;
  List<Flashcard> quizCards = [];

  @override
  void initState() {
    super.initState();
    quizCards = List<Flashcard>.from(flashcards)..shuffle();
    quizCards = quizCards.take(10).toList();
  }

  void _nextCard() {
    if (selectedOption == quizCards[currentIndex].correctAnswer) {
      score++;
    }

    if (currentIndex < quizCards.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
        showCorrectAnswer = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ResultPage(score: score)),
      );
    }
  }

  Widget _buildOption(String option, String correctAnswer) {
    bool isSelected = selectedOption == option;
    bool isCorrect = option == correctAnswer;
    Color? bgColor;
    Icon? icon;

    if (selectedOption != null) {
      if (isSelected && isCorrect) {
        bgColor = Colors.green.shade100;
        icon = Icon(Icons.check_circle, color: Colors.green);
      } else if (isSelected && !isCorrect) {
        bgColor = Colors.red.shade100;
        icon = Icon(Icons.cancel, color: Colors.red);
      } else if (showCorrectAnswer && isCorrect) {
        bgColor = Colors.green.shade100;
        icon = Icon(Icons.check_circle, color: Colors.green);
      }
    }

    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(option),
        trailing: icon,
        onTap:
            selectedOption == null
                ? () => setState(() => selectedOption = option)
                : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = quizCards[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.onThemeToggle,
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => setState(() => showCorrectAnswer = true),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  card.question,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 30),
            ...card.options
                .map((opt) => _buildOption(opt, card.correctAnswer))
                .toList(),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: selectedOption != null ? _nextCard : null,
              icon: Icon(Icons.arrow_forward),
              label: Text(
                currentIndex < quizCards.length - 1 ? 'Next' : 'Finish',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
