import 'package:flutter/material.dart';

import './screens/splash_screen.dart';
import './screens/login_screen.dart';
import './screens/search_location.dart';
import './screens/add_new_child_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/common_form_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "WorkSans",
      ),
      routes: {
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SearchLocation.routeName: (ctx) => SearchLocation(),
        AddNewChild.routeName: (ctx) => const AddNewChild(),
        DashboardScreen.routeName: (ctx) => const DashboardScreen(),
        CommonFormScreen.routeName: (ctx) => const CommonFormScreen()
      },
      home: const SplashScreen(),
    );
  }
}

