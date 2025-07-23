import 'package:flashquiz/View/Flutter_quiz_page.dart';
import 'package:flutter/material.dart';

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
                    (_) => FlutterQuizPage(
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
