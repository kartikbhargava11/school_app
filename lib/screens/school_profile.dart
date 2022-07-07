import 'package:flutter/material.dart';

import '../widgets/school_profile_header.dart';
import '../widgets/school_profile_actions.dart';
import '../widgets/school_profile_apply_to_classes.dart';
import '../widgets/school_profile_stats.dart';
import '../widgets/school_profile_fee_structure.dart';

import '../models/school.dart';

class SchoolProfile extends StatelessWidget {
  final School school;
  const SchoolProfile({
    required this.school,
    Key? key}) : super(key: key);

  Widget _buildContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      child: Card(
        elevation: 4.0,
        child: child,
      )
    );
  }

  Widget _buildSizedBox({required double height}) {
    return SizedBox(
      height: height,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    school.imageUrl,
                  )
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        iconSize: 32.0,
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            color: Colors.white,
                            iconSize: 32.0,
                            icon: const Icon(Icons.share),
                          ),
                          IconButton(
                            onPressed: () {},
                            color: Colors.white,
                            iconSize: 32.0,
                            icon: const Icon(Icons.shopping_cart),
                          ),
                        ],
                      )
                    ],
                  )
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _buildContainer(
                    child: SchoolProfileHeader(
                      school: school,
                    )
                  ),
                )
              ],
            ),
            _buildContainer(
              child: const SchoolProfileActions(),
            ),
            _buildSizedBox(
              height: 6.0,
            ),
            _buildContainer(
              child: SchoolProfileApplyToClasses(
                formDetails: school.formDetails,
              )
            ),
            _buildSizedBox(
              height: 6.0,
            ),
            _buildContainer(
              child: SchoolProfileStats(
                school: school,
              )
            ),
            _buildSizedBox(
              height: 6.0,
            ),
            _buildContainer(
              child: SchoolProfileFeeStructure()
            ),
          ]
        )
      ),
    );
  }
}
