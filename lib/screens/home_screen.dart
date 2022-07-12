import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sticky_headers/sticky_headers.dart';

import '../widgets/hero_section.dart';
import '../widgets/school_card.dart';

import './login_screen.dart';
import './search_location.dart';
import './dashboard_screen.dart';

import '../models/school.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
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
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
            icon: const Icon(
              Icons.shopping_cart_outlined
            ),
            iconSize: 30.0,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, DashboardScreen.routeName);
            },
            icon: const Icon(
              Icons.dashboard
            ),
            iconSize: 30.0,
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Colors.white,
            title: Form(
              key: _formKey,
              child: Column(
                children: [
                  Material(
                    elevation: 2.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        hintText: "Which School are you looking?",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: Colors.red,
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            sliver: SliverToBoxAdapter(
              child: HeroSection(),
            )
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
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
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
            sliver: SliverToBoxAdapter(
              child: Align(
                alignment: AlignmentDirectional.center,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: schools.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.blue,
                  ),
                  onDotClicked: (index) {
                    _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut
                    );
                  },
                ),
              )
            ),
          )
        ],
      )
    );
  }
}


