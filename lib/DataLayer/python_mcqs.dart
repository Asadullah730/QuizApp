import 'package:flashquiz/Model/flash_card_model.dart';

List<Flashcard> pythonmcqs = [
  Flashcard(
    question: 'Who developed Python?',
    correctAnswer: 'Guido van Rossum',
    options: [
      'James Gosling',
      'Guido van Rossum',
      'Dennis Ritchie',
      'Bjarne Stroustrup',
    ],
  ),
  Flashcard(
    question: 'Which keyword is used to create a function in Python?',
    correctAnswer: 'def',
    options: ['function', 'define', 'def', 'fun'],
  ),
  Flashcard(
    question: 'What is the output of: print(type(10))?',
    correctAnswer: "<class 'int'>",
    options: ['<type int>', '<class int>', "<class 'int'>", 'int'],
  ),
  Flashcard(
    question: 'How do you insert comments in Python?',
    correctAnswer: 'Using # symbol',
    options: ['Using //', 'Using <!-- -->', 'Using /* */', 'Using # symbol'],
  ),
  Flashcard(
    question: 'Which of the following is a Python data type?',
    correctAnswer: 'List',
    options: ['Array', 'Record', 'List', 'Pointer'],
  ),
  Flashcard(
    question: 'What does the len() function do?',
    correctAnswer: 'Returns the length of an object',
    options: [
      'Deletes an object',
      'Creates a list',
      'Returns the length of an object',
      'Counts variables',
    ],
  ),
  Flashcard(
    question: 'What is the correct file extension for Python files?',
    correctAnswer: '.py',
    options: ['.pt', '.pyth', '.py', '.pyt'],
  ),
  Flashcard(
    question: 'How do you start a for loop in Python?',
    correctAnswer: 'for x in range(5):',
    options: [
      'for(x = 0; x < 5; x++)',
      'for x in range(5):',
      'foreach x in range(5)',
      'loop x to 5',
    ],
  ),
  Flashcard(
    question: 'What is the output of: print("Hello" + "World")?',
    correctAnswer: 'HelloWorld',
    options: ['Hello World', 'Hello+World', 'HelloWorld', '"Hello" + "World"'],
  ),
  Flashcard(
    question: 'What is a correct way to create a dictionary in Python?',
    correctAnswer: '{"key": "value"}',
    options: [
      '[key => value]',
      '{"key": "value"}',
      '{key, value}',
      'dictionary(key:value)',
    ],
  ),
  Flashcard(
    question: 'What is the use of the pass statement?',
    correctAnswer:
        'It is a null operation used when a statement is syntactically required',
    options: [
      'Passes control to next program',
      'Exits the loop',
      'Skips a value',
      'It is a null operation used when a statement is syntactically required',
    ],
  ),
  Flashcard(
    question: 'Which of the following is not a Python keyword?',
    correctAnswer: 'then',
    options: ['assert', 'yield', 'nonlocal', 'then'],
  ),
  Flashcard(
    question: 'How do you define a block of code in Python?',
    correctAnswer: 'Using indentation',
    options: [
      'Using brackets {}',
      'Using BEGIN END',
      'Using indentation',
      'Using parentheses ()',
    ],
  ),
  Flashcard(
    question: 'Which function is used to get input from the user?',
    correctAnswer: 'input()',
    options: ['read()', 'get()', 'scan()', 'input()'],
  ),
  Flashcard(
    question: 'What will print(2 ** 3) return?',
    correctAnswer: '8',
    options: ['6', '9', '8', '5'],
  ),
  Flashcard(
    question: 'Which operator is used for floor division?',
    correctAnswer: '//',
    options: ['/', '//', '%', 'div'],
  ),
  Flashcard(
    question: 'What is the output of: bool("")?',
    correctAnswer: 'False',
    options: ['True', 'Error', 'False', 'None'],
  ),
  Flashcard(
    question: 'Which data structure uses key-value pairs?',
    correctAnswer: 'Dictionary',
    options: ['List', 'Set', 'Dictionary', 'Tuple'],
  ),
  Flashcard(
    question: 'What does pip stand for?',
    correctAnswer: 'Pip Installs Packages',
    options: [
      'Python Installation Program',
      'Preferred Installer Program',
      'Pip Installs Packages',
      'Package Integration Protocol',
    ],
  ),
  Flashcard(
    question: 'Which of the following is immutable?',
    correctAnswer: 'Tuple',
    options: ['List', 'Dictionary', 'Tuple', 'Set'],
  ),
  Flashcard(
    question: 'How do you raise an exception in Python?',
    correctAnswer: 'raise',
    options: ['throw', 'except', 'raise', 'error'],
  ),
  Flashcard(
    question: 'Which module is used for regular expressions?',
    correctAnswer: 're',
    options: ['regex', 'pyre', 'reg', 're'],
  ),
  Flashcard(
    question: 'Which method is used to convert string to lowercase?',
    correctAnswer: 'lower()',
    options: ['small()', 'lowercase()', 'toLower()', 'lower()'],
  ),
  Flashcard(
    question: 'Which keyword is used to handle exceptions?',
    correctAnswer: 'try-except',
    options: ['try-catch', 'handle', 'try-except', 'throw-catch'],
  ),
  Flashcard(
    question: 'What will print(10//3) return?',
    correctAnswer: '3',
    options: ['3.3', '3', '3.0', '4'],
  ),
  Flashcard(
    question: 'How do you open a file in read mode?',
    correctAnswer: 'open("file.txt", "r")',
    options: [
      'open("file.txt")',
      'open("file.txt", "read")',
      'open("file.txt", "r")',
      'file.open("r")',
    ],
  ),
  Flashcard(
    question: 'What is the output of: print(type([]))?',
    correctAnswer: "<class 'list'>",
    options: ["<class 'list'>", "<list>", "list", "type: list"],
  ),
  Flashcard(
    question: 'How do you add an element to a list?',
    correctAnswer: 'append()',
    options: ['add()', 'push()', 'append()', 'insert()'],
  ),
  Flashcard(
    question: 'What does range(5) return?',
    correctAnswer: '0 to 4',
    options: ['0 to 5', '1 to 5', '0 to 4', '1 to 4'],
  ),
  Flashcard(
    question: 'Which loop runs at least once?',
    correctAnswer: 'while loop (with proper condition)',
    options: [
      'for loop',
      'do-while loop',
      'while loop (with proper condition)',
      'None of the above',
    ],
  ),
  Flashcard(
    question: 'What is the use of "is" keyword?',
    correctAnswer: 'To test object identity',
    options: [
      'To compare values',
      'To import modules',
      'To test object identity',
      'To check type',
    ],
  ),
];
