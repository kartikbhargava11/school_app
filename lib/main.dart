import 'package:flutter/material.dart';

import './screens/nav_screen.dart';
import './screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
      },
      home: const NavScreen(),
    );
  }
}

