import 'package:flutter/material.dart';

class SearchLocation extends StatelessWidget {
  static const routeName = "/location";
  const SearchLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Search Location"
        )
      ),
    );
  }
}
