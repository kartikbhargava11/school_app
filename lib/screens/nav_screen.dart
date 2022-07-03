import 'package:flutter/material.dart';

import './home_screen.dart';
import '../widgets/custom_tab_bar.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    "Home": Icons.home,
    "Compare": Icons.compare,
    "School": Icons.school,
    "Admission": Icons.calendar_month,
    "Profile": Icons.menu,
  };
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: CustomTabBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          icons: _icons,
          selectedTab: _selectedIndex,
        )
      )
    );
  }
}
