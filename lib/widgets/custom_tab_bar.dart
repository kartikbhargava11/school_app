import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final Map<String, IconData> icons;
  final int selectedTab;
  final Function(int) onTap;

  const CustomTabBar({
    required this.icons,
    required this.selectedTab,
    required this.onTap,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: const EdgeInsets.only(bottom: 20.0),
      onTap: onTap,
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.blue, width: 3.0)),
      ),
      labelColor: Colors.blue,
      labelStyle: const TextStyle(
        fontSize: 10.0,
      ),
      unselectedLabelColor: Colors.black,
      tabs: icons.map((title, icon) {
        return MapEntry(title, Tab(
          icon: Icon(
            icon,
            size: 30.0,
          ),
          text: title,
        ));
      }).values.toList()
    );
  }
}
