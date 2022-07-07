import 'package:flutter/material.dart';

import '../models/school.dart';

class SchoolProfileHeader extends StatelessWidget {
  final School school;
  const SchoolProfileHeader({
    required this.school,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                school.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )
            ),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 12.0,
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Text(
                    school.completeAddress,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    )
                )
              ],
            ),
          ],
        )
    );
  }
}
