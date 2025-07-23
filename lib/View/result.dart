import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;

  ResultPage({required this.score});

  @override
  Widget build(BuildContext context) {
    String message = '';
    IconData iconData = Icons.emoji_events;
    Color iconColor = Colors.deepPurple;
    Color backgroundColor = Colors.deepPurple.shade50;

    // Determine message and style
    if (score < 5) {
      message = "You are Fail. Best of luck for next time!";
      iconData = Icons.sentiment_dissatisfied;
      iconColor = Colors.red;
      backgroundColor = Colors.red.shade50;
    } else if (score >= 8 && score < 10) {
      message = "Excellent Work!";
      iconData = Icons.star;
      iconColor = Colors.orange;
      backgroundColor = Colors.orange.shade50;
    } else if (score == 10) {
      message = "Congratulations! You got maximum marks!";
      iconData = Icons.emoji_events;
      iconColor = Colors.green;
      backgroundColor = Colors.green.shade50;
    } else {
      message = "Good effort!";
      iconData = Icons.thumb_up;
      iconColor = Colors.blue;
      backgroundColor = Colors.blue.shade50;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 100, color: iconColor),
              SizedBox(height: 20),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
              SizedBox(height: 20),
              Text('Your Score: $score / 10', style: TextStyle(fontSize: 22)),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.replay),
                label: Text('Retake Quiz'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: iconColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
