import 'package:flutter/material.dart';

import '../models/school.dart';

import '../screens/school_profile.dart';

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
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SchoolProfile(school: school)));
              },
              child: Stack(
                children: [
                  Image(
                    width: double.infinity,
                    image: NetworkImage(
                        school.imageUrl
                    ),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 1),
                            blurRadius: 6.0
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), bottomLeft: Radius.circular(25.0)),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            "${school.favourites}",
                          )
                        ],
                      )
                    )
                  ),
                  if (school.isAdmissionOpen)
                    Positioned(
                      top: 60,
                      right: 0,
                      child: Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 1),
                              blurRadius: 6.0
                            )
                          ],
                          color: Colors.green,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), bottomLeft: Radius.circular(25.0)),
                        ),
                        child: const Text(
                          "Admission On Going",
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 10,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 1),
                              blurRadius: 6.0
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), bottomLeft: Radius.circular(25.0)),
                      ),
                      child: Text(
                        "${school.distance} km",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                        ),
                      ),

                    )
                  ),
                ],
              )
            )
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
                  const Text(
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
