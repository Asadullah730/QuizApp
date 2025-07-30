import 'dart:async';
import 'package:flashquiz/View/admin_panel/authpages/lgoin_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Image(image: AssetImage('assets/applogo/applogo.jpeg')),
        ),
      ),
    );
  }
}
