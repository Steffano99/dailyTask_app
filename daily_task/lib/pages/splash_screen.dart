import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'home_page.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color.fromARGB(255, 2, 59, 59),
      splash: Center(
        child: Row(
          mainAxisSize: MainAxisSize
              .min, // This ensures the Row takes up only as much space as needed
          mainAxisAlignment: MainAxisAlignment.center, // This centers the children within the Row
          children: [
            Text(
              'DAILY',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 24, // Adjust the size as needed
              ),
            ),
            Text(
              'TASK',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 24, // Adjust the size as needed
              ),
            ),
            SizedBox(width: 8), // Optional space between the text and icon
            Icon(
              Icons.check_circle_rounded,
              color: Color.fromARGB(255, 240, 97, 9),
              size: 40, // Adjust the size as needed
            ),
          ],
        ),
      ),
      nextScreen: const HomePage(),
      duration: 5000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
