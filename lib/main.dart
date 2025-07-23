import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(QuizApp());
}

class Flashcard {
  String question;
  String correctAnswer;
  List<String> options;

  Flashcard({
    required this.question,
    required this.correctAnswer,
    required this.options,
  });
}

class QuizApp extends StatefulWidget {
  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(
        onThemeToggle: () => setState(() => isDarkTheme = !isDarkTheme),
        isDarkTheme: isDarkTheme,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkTheme;

  HomePage({required this.onThemeToggle, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('Welcome to Quiz App'),
        actions: [
          IconButton(icon: Icon(Icons.brightness_6), onPressed: onThemeToggle),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text('Take Quiz'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (_) => QuizPage(
                      onThemeToggle: onThemeToggle,
                      isDarkTheme: isDarkTheme,
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkTheme;

  QuizPage({required this.onThemeToggle, required this.isDarkTheme});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Flashcard> flashcards = [
    Flashcard(
      question: 'What is Flutter?',
      correctAnswer: 'A UI toolkit by Google for building apps.',
      options: [
        'A UI toolkit by Google for building apps.',
        'A backend language.',
        'An OS for smartphones.',
        'A type of database',
      ],
    ),
    Flashcard(
      question: 'What language does Flutter use?',
      correctAnswer: 'Dart',
      options: ['Java', 'Dart', 'Python', 'C++'],
    ),
    Flashcard(
      question: 'What is StatefulWidget?',
      correctAnswer: 'A widget that has mutable state.',
      options: [
        'A widget with immutable state.',
        'A widget that has mutable state.',
        'A widget used for navigation.',
        'A widget for animations.',
      ],
    ),
    Flashcard(
      question: 'What is the entry point of a Flutter app?',
      correctAnswer: 'main()',
      options: ['start()', 'init()', 'main()', 'runApp()'],
    ),
    Flashcard(
      question: 'Which widget is used for layout in a row?',
      correctAnswer: 'Row',
      options: ['Column', 'Row', 'Stack', 'ListView'],
    ),
    Flashcard(
      question: 'Which company developed Flutter?',
      correctAnswer: 'Google',
      options: ['Facebook', 'Apple', 'Google', 'Microsoft'],
    ),
    Flashcard(
      question: 'Which file contains the dependencies in Flutter?',
      correctAnswer: 'pubspec.yaml',
      options: ['main.dart', 'pubspec.yaml', 'build.gradle', 'manifest.json'],
    ),
    Flashcard(
      question: 'Which widget provides scrolling capability?',
      correctAnswer: 'ListView',
      options: ['Container', 'Column', 'Row', 'ListView'],
    ),
    Flashcard(
      question: 'What does setState() do?',
      correctAnswer: 'Updates the UI',
      options: [
        'Destroys the widget',
        'Updates the UI',
        'Deletes state',
        'Saves data',
      ],
    ),
    Flashcard(
      question: 'Which widget is used to take user input?',
      correctAnswer: 'TextField',
      options: ['Text', 'TextFormField', 'TextField', 'InputBox'],
    ),
  ];

  int currentIndex = 0;
  String? selectedOption;
  int score = 0;
  bool showCorrectAnswer = false;

  void _nextCard() {
    if (selectedOption == flashcards[currentIndex].correctAnswer) {
      score++;
    }

    if (currentIndex < flashcards.length - 1) {
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
    final card = flashcards[currentIndex];

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
                currentIndex < flashcards.length - 1 ? 'Next' : 'Finish',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;

  ResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_events, size: 100, color: Colors.deepPurple),
              SizedBox(height: 20),
              Text(
                'Quiz Completed!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text('Your Score: $score / 10', style: TextStyle(fontSize: 22)),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.replay),
                label: Text('Retake Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
