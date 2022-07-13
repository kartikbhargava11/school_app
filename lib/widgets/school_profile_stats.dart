import 'package:flutter/material.dart';

import '../models/school.dart';

class SchoolProfileStats extends StatelessWidget {
  final School school;
  const SchoolProfileStats({
    required this.school,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.blue[200],
          ),
          child: const Text(
            "Key School Stats",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ownership",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0
                      )
                    ),
                    Text(
                      school.ownership,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0
                      )
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      "Year of Establishment",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0
                      )
                    ),
                    Text(
                      "${school.establishment}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0
                      )
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      "Campus Size",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0
                      )
                    ),
                    Text(
                      school.campusSize,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0
                      )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Board",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0
                      )
                    ),
                    Text(
                      school.board,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0
                      )
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      "Co-Ed Status",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0
                      )
                    ),
                    Text(
                      school.coEdStatus,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0
                      )
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text(
                      "Campus Type",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0
                      )
                    ),
                    Text(
                      school.campusType,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
