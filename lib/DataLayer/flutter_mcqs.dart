import 'package:flashquiz/Model/flash_card_model.dart';

List<Flashcard> fluttermcqs = [
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
  Flashcard(
    question: 'Which widget helps in laying widgets vertically?',
    correctAnswer: 'Column',
    options: ['Row', 'Column', 'Stack', 'Wrap'],
  ),
  Flashcard(
    question: 'Which method is used to launch the Flutter app?',
    correctAnswer: 'runApp()',
    options: ['run()', 'launchApp()', 'startApp()', 'runApp()'],
  ),
  Flashcard(
    question: 'Which widget is used to make something clickable?',
    correctAnswer: 'GestureDetector',
    options: ['Container', 'Column', 'GestureDetector', 'Stack'],
  ),
  Flashcard(
    question: 'Which Flutter widget is used to draw a box with padding?',
    correctAnswer: 'Padding',
    options: ['SizedBox', 'Container', 'Padding', 'Align'],
  ),
  Flashcard(
    question: 'What is a StatelessWidget?',
    correctAnswer: 'A widget that never changes',
    options: [
      'A widget that changes dynamically',
      'A widget that never changes',
      'A widget for managing lists',
      'A widget for async tasks',
    ],
  ),
  Flashcard(
    question: 'What tool helps you format Dart code?',
    correctAnswer: 'dart format',
    options: ['flutter clean', 'dart format', 'flutter pub get', 'dart run'],
  ),
  Flashcard(
    question: 'How do you add packages in Flutter?',
    correctAnswer: 'Add to pubspec.yaml and run flutter pub get',
    options: [
      'Add to pubspec.yaml and run flutter install',
      'Use App Store',
      'Add to build.gradle',
      'Add to pubspec.yaml and run flutter pub get',
    ],
  ),
  Flashcard(
    question: 'What is hot reload in Flutter?',
    correctAnswer: 'Update code changes without restarting the app',
    options: [
      'Run app in debug mode',
      'Restart the app',
      'Update code changes without restarting the app',
      'Reset app to default state',
    ],
  ),
  Flashcard(
    question: 'Which layout widget can overlap children?',
    correctAnswer: 'Stack',
    options: ['Row', 'Column', 'Stack', 'ListView'],
  ),
  Flashcard(
    question: 'Which widget is used to apply styling to text?',
    correctAnswer: 'TextStyle',
    options: ['TextEdit', 'TextStyle', 'FontTheme', 'ThemeData'],
  ),
  Flashcard(
    question: 'Which widget is commonly used for navigation?',
    correctAnswer: 'Navigator',
    options: ['PageRoute', 'Route', 'Navigator', 'Redirector'],
  ),
  Flashcard(
    question: 'Which keyword is used for async functions in Dart?',
    correctAnswer: 'async',
    options: ['await', 'future', 'async', 'then'],
  ),
  Flashcard(
    question: 'What is the default build method return type in Flutter?',
    correctAnswer: 'Widget',
    options: ['MaterialApp', 'void', 'Widget', 'Scaffold'],
  ),
  Flashcard(
    question: 'Which widget adds space between widgets?',
    correctAnswer: 'SizedBox',
    options: ['Container', 'Padding', 'Align', 'SizedBox'],
  ),
  Flashcard(
    question: 'Which widget makes a UI responsive to screen size?',
    correctAnswer: 'LayoutBuilder',
    options: ['Expanded', 'FittedBox', 'LayoutBuilder', 'MediaQuery'],
  ),
  Flashcard(
    question: 'Which package is used for state management?',
    correctAnswer: 'GetX',
    options: ['http', 'Provide_state', 'GetX', 'shared_preferences'],
  ),
  Flashcard(
    question: 'What is the purpose of initState()?',
    correctAnswer: 'Initialize state before widget builds',
    options: [
      'Dispose variables',
      'Render the widget',
      'Initialize state before widget builds',
      'Navigate to a new page',
    ],
  ),
  Flashcard(
    question: 'How do you debug a Flutter app?',
    correctAnswer: 'Use Flutter DevTools',
    options: [
      'Use Visual Studio only',
      'Use Dart Analyzer only',
      'Use Flutter DevTools',
      'No tools available',
    ],
  ),
  Flashcard(
    question: 'What does the `build()` method do?',
    correctAnswer: 'Describes the widget tree',
    options: [
      'Builds native app',
      'Describes the widget tree',
      'Runs app logic',
      'Loads pubspec.yaml',
    ],
  ),
  Flashcard(
    question: 'What is the function of `Scaffold` in Flutter?',
    correctAnswer: 'Provides basic visual layout structure',
    options: [
      'Renders backend logic',
      'Creates databases',
      'Provides basic visual layout structure',
      'Connects to API',
    ],
  ),
];
