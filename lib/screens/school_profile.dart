import 'package:flutter/material.dart';

import '../models/school.dart';

class SchoolProfile extends StatelessWidget {
  final School school;
  const SchoolProfile({
    required this.school,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ]
        )
      ),
    );
  }
}
