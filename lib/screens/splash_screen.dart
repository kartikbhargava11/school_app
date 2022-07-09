import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import './nav_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _navigateToHome() async {
    await Future.delayed(const Duration(
      milliseconds: 1500,
    ), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const NavScreen() ));
    });
  }


  @override
  void initState() {
    super.initState();
    // _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blue,
      splash: const Center(
        child: Text(
          "one apply",
          style: TextStyle(
            fontSize: 64.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Bangers",
            letterSpacing: 2
          )
        )
      ),
      nextScreen: const NavScreen() ,
    );
  }
}
