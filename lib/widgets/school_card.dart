import 'package:flutter/material.dart';

import '../models/school.dart';

class SchoolCard extends StatelessWidget {
  final School school;
  const SchoolCard({
    required this.school,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Image(
              image: NetworkImage(
                school.imageUrl
              ),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    school.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    )
                  ),
                  const SizedBox(
                    height: 12.0,
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
                        school.address,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        )
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Classes: ${school.classes}"
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Board: ${school.board}"
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    school.monthlyFees
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "Point Calculator",
                          style: TextStyle(
                            color: Colors.grey,
                          )
                        )
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "Compare",
                          style: TextStyle(
                            color: Colors.grey,
                          )
                        )
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.red
                          )
                        ),
                        child: const Text(
                          "Apply Now",
                          style: TextStyle(
                            color: Colors.white,
                          )
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "Official Application Partner"
                  )
                ],
              )
            )
          )
        ],
      ),
    );
  }
}
