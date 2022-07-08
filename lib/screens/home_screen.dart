import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/hero_section.dart';
import '../widgets/school_card.dart';

import './login_screen.dart';
import './search_location.dart';

import '../models/school.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late PageController _slideshow;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _slideshow = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _slideshow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SearchLocation.routeName);
          },
          child: Row(
            children: const [
              Icon(
                Icons.location_on,
                color: Colors.red,
                size: 18.0,
              ),
              SizedBox(
                width: 4.0,
              ),
              Expanded(
                child: Text(
                  "9/59, Block 9, Press Colony, Mayapuri",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0
                  )
                ),
              ),
              SizedBox(
                width: 4.0,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 20.0,
              ),
            ],
          ),
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
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
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
                controller: _pageController,
                itemCount: schools.length,
                itemBuilder: (ctx, index) {
                  final School school = schools[index];
                  return SchoolCard(
                    school: school,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: schools.length,
              effect: const WormEffect(),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceOut
                );
              },
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 415,
              child: PageView.builder(
                controller: _slideshow,
                itemCount: 3,
                itemBuilder: (ctx, index) {
                  return Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/image${index + 1}.jpg"),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SmoothPageIndicator(
              controller: _slideshow,
              count: 3,
              effect: const WormEffect(),
              onDotClicked: (index) {
                _slideshow.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceOut
                );
              },
            ),
          ],
        )
      ),
    );
  }
}


