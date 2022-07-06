import 'package:flutter/material.dart';

import '../widgets/classes_list.dart';
import '../widgets/profile_actions.dart';

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
                    child: Padding(
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
                    )
                  ),
                )
              ],
            ),
            _buildContainer(
              child: const ProfileActions(),
            ),
            const SizedBox(
              height: 6.0,
            ),
            _buildContainer(
              child: ClassesList()
            ),
          ]
        )
      ),
    );
  }
}
