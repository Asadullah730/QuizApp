import 'package:flashquiz/DataLayer/flutter_mcqs.dart';
import 'package:flashquiz/DataLayer/java_mcqs.dart';
import 'package:flashquiz/Model/flash_card_model.dart';
import 'package:flashquiz/View/result.dart';
import 'package:flutter/material.dart';

class JavaQuizPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkTheme;

  JavaQuizPage({required this.onThemeToggle, required this.isDarkTheme});

  @override
  _JavaQuizPageState createState() => _JavaQuizPageState();
}

class _JavaQuizPageState extends State<JavaQuizPage> {
  int currentIndex = 0;
  String? selectedOption;
  int score = 0;
  bool showCorrectAnswer = false;
  List<Flashcard> quizCards = [];

  @override
  void initState() {
    super.initState();
    quizCards = List<Flashcard>.from(javamcqs)..shuffle();
    quizCards = quizCards.take(10).toList(); // limit to 10
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

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2)),
        ],
      ),
      child: ListTile(
        title: Text(option, style: TextStyle(fontSize: 16)),
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
    int remaining = quizCards.length - currentIndex;

    return Scaffold(
      backgroundColor: Color(0xFFF4F6FD), // Light bluish pastel background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Top Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Flutter Quiz',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Row(
                    children: [
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.brightness_6,
                      //     color: Colors.deepPurple,
                      //   ),
                      //   onPressed: widget.onThemeToggle,
                      // ),
                      IconButton(
                        icon: Icon(
                          Icons.info_outline,
                          color: Colors.deepPurple,
                        ),
                        onPressed:
                            () => setState(() => showCorrectAnswer = true),
                      ),
                    ],
                  ),
                ],
              ),

              // Progress bar
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Remaining: $remaining / ${quizCards.length}',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Text(
                      'Score: $score',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              LinearProgressIndicator(
                value: (currentIndex + 1) / quizCards.length,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                minHeight: 8,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.2),

              // Question Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    card.question,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              // Options
              ...card.options.map(
                (opt) => _buildOption(opt, card.correctAnswer),
              ),

              SizedBox(height: 30),

              // Next/Finish Button
              ElevatedButton.icon(
                onPressed: selectedOption != null ? _nextCard : null,
                icon: Icon(Icons.arrow_forward),
                label: Text(
                  currentIndex < quizCards.length - 1 ? 'Next' : 'Submit',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
