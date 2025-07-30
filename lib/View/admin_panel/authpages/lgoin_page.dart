import 'package:flashquiz/View/home.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF73C8A9), Color(0xFF373B44)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double cardWidth = screenWidth > 600 ? 500 : screenWidth * 0.9;
            double fontSizeTitle = screenWidth > 600 ? 26 : 22;
            double fontSizeEmail = screenWidth > 600 ? 16 : 14;
            double inputFontSize = screenWidth > 600 ? 18 : 16;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: cardWidth,
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                              'assets/fiverr cover img.jpg',
                            ),
                            backgroundColor: Colors.teal,
                            child: Icon(
                              Icons.person,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Welcome AsadUllah!',
                            style: TextStyle(
                              fontSize: fontSizeTitle,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Times New Roman',
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'asadbrohi025@gmail.com',
                            style: TextStyle(
                              fontSize: fontSizeEmail,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            controller: usernameController,
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Please enter your username'
                                        : null,
                            style: TextStyle(fontSize: inputFontSize),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Please enter your password'
                                        : null,
                            style: TextStyle(fontSize: inputFontSize),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (usernameController.text == 'admin' &&
                                      passwordController.text == 'admin') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Login successful!'),
                                      ),
                                    );

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => HomePage(
                                              onThemeToggle: () {},
                                              isDarkTheme: false,
                                            ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Invalid credentials'),
                                      ),
                                    );
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                backgroundColor: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: inputFontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
