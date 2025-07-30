// import 'package:flashquiz/View/Flutter_quiz_page.dart';
// import 'package:flashquiz/View/cpp_quiz_page.dart';
// import 'package:flashquiz/View/java_quiz_page.dart';
// import 'package:flashquiz/View/python_quiz_page.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   final VoidCallback onThemeToggle;
//   final bool isDarkTheme;

//   HomePage({required this.onThemeToggle, required this.isDarkTheme});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, dynamic>> courses = [
//       {
//         'title': 'Flutter',
//         'icon': Icons.flutter_dash,
//         'gradient': LinearGradient(
//           colors: [Colors.blue, Colors.lightBlueAccent],
//         ),
//         'page': FlutterQuizPage(
//           onThemeToggle: onThemeToggle,
//           isDarkTheme: isDarkTheme,
//         ),
//       },
//       {
//         'title': 'Python',
//         'icon': Icons.code,
//         'gradient': LinearGradient(
//           colors: [Colors.green, Colors.lightGreenAccent],
//         ),
//         'page': PythonQuizPage(
//           onThemeToggle: onThemeToggle,
//           isDarkTheme: isDarkTheme,
//         ),
//       },
//       {
//         'title': 'C++',
//         'icon': Icons.computer,
//         'gradient': LinearGradient(
//           colors: [Colors.deepPurple, Colors.purpleAccent],
//         ),
//         'page': CppQuizPage(
//           onThemeToggle: onThemeToggle,
//           isDarkTheme: isDarkTheme,
//         ),
//       },
//       {
//         'title': 'Java',
//         'icon': Icons.integration_instructions,
//         'gradient': LinearGradient(
//           colors: [Colors.orange, Colors.deepOrangeAccent],
//         ),
//         'page': JavaQuizPage(
//           onThemeToggle: onThemeToggle,
//           isDarkTheme: isDarkTheme,
//         ),
//       },
//     ];

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: AppBar(
//         title: Text('📚 Programming Quiz App'),
//         actions: [
//           IconButton(icon: Icon(Icons.brightness_6), onPressed: onThemeToggle),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Hero section
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     'assets/quiz_banner.png',
//                     height: 180,
//                   ), // optional illustration
//                   SizedBox(height: 16),
//                   Text(
//                     'Sharpen Your Programming Skills!',
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Choose a quiz topic below and test your knowledge.',
//                     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             // Grid of quiz cards
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: courses.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   childAspectRatio: 0.9,
//                 ),
//                 itemBuilder: (context, index) {
//                   final course = courses[index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => course['page']),
//                       );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: course['gradient'],
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 6,
//                             offset: Offset(2, 4),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(course['icon'], size: 60, color: Colors.white),
//                           SizedBox(height: 12),
//                           Text(
//                             course['title'],
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flashquiz/View/Flutter_quiz_page.dart';
import 'package:flashquiz/View/cpp_quiz_page.dart';
import 'package:flashquiz/View/java_quiz_page.dart';
import 'package:flashquiz/View/python_quiz_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final bool isDarkTheme;

  HomePage({required this.onThemeToggle, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> courses = [
      {
        'title': 'Flutter',
        'icon': Icons.flutter_dash,
        'gradient': LinearGradient(
          colors: [Colors.blue, Colors.lightBlueAccent],
        ),
        'page': FlutterQuizPage(
          onThemeToggle: onThemeToggle,
          isDarkTheme: isDarkTheme,
        ),
      },
      {
        'title': 'Python',
        'icon': Icons.code,
        'gradient': LinearGradient(
          colors: [Colors.green, Colors.lightGreenAccent],
        ),
        'page': PythonQuizPage(
          onThemeToggle: onThemeToggle,
          isDarkTheme: isDarkTheme,
        ),
      },
      {
        'title': 'C++',
        'icon': Icons.computer,
        'gradient': LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
        ),
        'page': CppQuizPage(
          onThemeToggle: onThemeToggle,
          isDarkTheme: isDarkTheme,
        ),
      },
      {
        'title': 'Java',
        'icon': Icons.integration_instructions,
        'gradient': LinearGradient(
          colors: [Colors.orange, Colors.deepOrangeAccent],
        ),
        'page': JavaQuizPage(
          onThemeToggle: onThemeToggle,
          isDarkTheme: isDarkTheme,
        ),
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text('📚 Programming Quiz App')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.asset('assets/quiz_banner.png', height: 180),
                  SizedBox(height: 16),
                  Text(
                    'Sharpen Your Programming Skills!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Choose a quiz topic below and test your knowledge.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Grid of quiz cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: courses.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => course['page']),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: course['gradient'],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(course['icon'], size: 60, color: Colors.white),
                          SizedBox(height: 12),
                          Text(
                            course['title'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
