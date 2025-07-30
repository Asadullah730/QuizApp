import 'package:flashquiz/DataLayer/python_mcqs.dart';
import 'package:flashquiz/Model/flash_card_model.dart';
import 'package:flashquiz/View/result.dart';
import 'package:flutter/material.dart';

class PythonQuizPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkTheme;

  const PythonQuizPage({
    super.key,
    required this.onThemeToggle,
    required this.isDarkTheme,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PythonQuizPageState createState() => _PythonQuizPageState();
}

class _PythonQuizPageState extends State<PythonQuizPage> {
  int currentIndex = 0;
  String? selectedOption;
  int score = 0;
  bool showCorrectAnswer = false;
  List<Flashcard> quizCards = [];

  void _addFlashcard() {
    TextEditingController questionCtrl = TextEditingController();
    TextEditingController correctCtrl = TextEditingController();
    List<TextEditingController> optionCtrls = List.generate(
      4,
      (_) => TextEditingController(),
    );

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Add Flashcard"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: questionCtrl,
                    decoration: const InputDecoration(labelText: "Question"),
                  ),
                  TextField(
                    controller: correctCtrl,
                    decoration: const InputDecoration(
                      labelText: "Correct Answer",
                    ),
                  ),
                  ...List.generate(
                    4,
                    (i) => TextField(
                      controller: optionCtrls[i],
                      decoration: InputDecoration(labelText: "Option ${i + 1}"),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    quizCards.add(
                      Flashcard(
                        question: questionCtrl.text,
                        correctAnswer: correctCtrl.text,
                        options: optionCtrls.map((e) => e.text).toList(),
                      ),
                    );
                  });
                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ],
          ),
    );
  }

  void _editFlashcard() {
    if (quizCards.isEmpty) return;

    Flashcard current = quizCards[currentIndex];
    TextEditingController questionCtrl = TextEditingController(
      text: current.question,
    );
    TextEditingController correctCtrl = TextEditingController(
      text: current.correctAnswer,
    );
    List<TextEditingController> optionCtrls =
        current.options.map((opt) => TextEditingController(text: opt)).toList();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Edit Flashcard"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: questionCtrl,
                    decoration: const InputDecoration(labelText: "Question"),
                  ),
                  TextField(
                    controller: correctCtrl,
                    decoration: const InputDecoration(
                      labelText: "Correct Answer",
                    ),
                  ),
                  ...List.generate(
                    4,
                    (i) => TextField(
                      controller: optionCtrls[i],
                      decoration: InputDecoration(labelText: "Option ${i + 1}"),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    quizCards[currentIndex] = Flashcard(
                      question: questionCtrl.text,
                      correctAnswer: correctCtrl.text,
                      options: optionCtrls.map((e) => e.text).toList(),
                    );
                  });
                  Navigator.pop(context);
                },
                child: const Text("Update"),
              ),
            ],
          ),
    );
  }

  void _deleteFlashcard() {
    if (quizCards.isEmpty) return;
    setState(() {
      quizCards.removeAt(currentIndex);
      if (currentIndex >= quizCards.length) {
        currentIndex = quizCards.length - 1;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      currentIndex = 0;
      selectedOption = null;
      score = 0;
      showCorrectAnswer = false;
    });
  }

  @override
  void initState() {
    super.initState();
    quizCards = List<Flashcard>.from(pythonmcqs)..shuffle();
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
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle_outline, color: Colors.green),
                    tooltip: 'Add Flashcard',
                    onPressed: _addFlashcard,
                  ),
                  IconButton(
                    icon: Icon(Icons.edit_note, color: Colors.orange),
                    tooltip: 'Edit Flashcard',
                    onPressed: _editFlashcard,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline, color: Colors.red),
                    tooltip: 'Delete Flashcard',
                    onPressed: _deleteFlashcard,
                  ),
                  IconButton(
                    icon: Icon(Icons.brightness_6, color: Colors.deepPurple),
                    onPressed: widget.onThemeToggle,
                  ),
                  IconButton(
                    icon: Icon(Icons.info_outline, color: Colors.deepPurple),
                    onPressed: () => setState(() => showCorrectAnswer = true),
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

              SizedBox(height: MediaQuery.of(context).size.height * 0.07),

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

              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              // Options
              ...card.options.map(
                (opt) => _buildOption(opt, card.correctAnswer),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

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
