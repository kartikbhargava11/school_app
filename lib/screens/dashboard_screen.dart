import 'dart:math';

import 'package:flutter/material.dart';

import './search_location.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  _buildContainerBox({ required Color? color, required IconData icon, required String label }) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              color ?? Colors.blue,
              Colors.white
            ],
            stops: const [0.16, 0.16],
            transform: const GradientRotation(pi / 2)
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 5,
              child: Icon(
                icon,
                color: color,
                size: 14.0,
              ),
            ),
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "0",
                      style: TextStyle(
                        fontSize: 18.0
                      )
                    ),
                    Flexible(
                      child: Text(
                        label,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12.0
                        )
                      ),
                    ),
                  ],
                )
            )
          ],
        ),
      )
    );
  }

  Widget _buildDropdownButton({ required VoidCallback onTap, required String label }) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
        child: Row(
          children: [
            Text(
              label
            ),
            const SizedBox(
              width: 5.0,
            ),
            const Icon(
              Icons.keyboard_arrow_down
            )
          ],
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            },
            icon: const Icon(
                Icons.shopping_cart_outlined
            ),
            iconSize: 30.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.filter_list_alt,
                        size: 24.0,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      const Text(
                        "Filters",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        )
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const SizedBox(
                        height: 30,
                        child: VerticalDivider(
                          thickness: 2.0,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      _buildDropdownButton(
                        onTap: () {},
                        label: "Add Child",
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      _buildDropdownButton(
                        onTap: () {},
                        label: "2022-2023",
                      ),
                    ],
                  ),
                ],
              )
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Text(
                "My Dashboard",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildContainerBox(
                    color: Colors.green,
                    icon: Icons.file_copy_rounded,
                    label: "Forms Submitted"
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  _buildContainerBox(
                    color: Colors.red,
                    icon: Icons.currency_pound,
                    label: "Payment Done"
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  _buildContainerBox(
                    color: Colors.blue[800],
                    icon: Icons.file_download_done,
                    label: "Application Submitted"
                  )
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}
