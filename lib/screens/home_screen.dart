import 'package:flutter/material.dart';

import '../widgets/hero_section.dart';
import '../widgets/school_card.dart';

import '../models/school.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.blue,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "UniApply",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          )
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined
            ),
            iconSize: 30.0,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined
            ),
            iconSize: 30.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: HeroSection(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 415,
              child: PageView.builder(
                controller: pageController,
                itemCount: schools.length,
                itemBuilder: (ctx, index) {
                  final School school = schools[index];
                  return SchoolCard(
                    school: school,
                  );
                },
              ),
            )
          ],
        )
      ),
    );
  }
}
