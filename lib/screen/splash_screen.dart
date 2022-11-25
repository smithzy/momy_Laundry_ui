import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      //decoration: const BoxDecoration(
      //image:
      //DecorationImage(image: AssetImage("assets/images/splash.jpg"))),
      color: Colors.white,
      child: const Image(
        image: AssetImage("assets/images/splashing.png"),
        width: 200,
        height: 500,
      ),
    );
  }
}
