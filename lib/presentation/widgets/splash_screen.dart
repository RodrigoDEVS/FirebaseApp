import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/presentation/screens/welcome/welcome_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return AnimatedSplashScreen(
        splash: Image.asset(
          'assets/images/broly.jpg',
          fit: BoxFit.cover,
        ),
        splashIconSize: size.longestSide,
        nextScreen: const WelcomePage(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade);
  }
}
