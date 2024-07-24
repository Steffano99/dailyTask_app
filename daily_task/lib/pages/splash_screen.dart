import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'home_page.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/daily_task.png'),
      nextScreen: const HomePage(),
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
