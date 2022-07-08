import 'package:flutter/material.dart';

import './add_new_child_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  Widget _buildContainer({ required IconData icon, required String label, required VoidCallback onTap, seeMore = true }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              icon,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              label
            ),
            const Spacer(),
            if (seeMore)
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14.0,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 22.0,
          fontWeight: FontWeight.bold
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_forward_ios),
            iconSize: 28.0,
          )
        ],
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1.0),
              ),
              child: const Text(
                "K",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0
                )
              )
            ),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Kartik Bhargava",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0
                  )
                ),
                SizedBox(
                  height: 2.0,
                ),
                Text(
                  "kartikbhargava4@gmail.com",
                  style: TextStyle(
                    fontSize: 10.0
                  )
                ),
                Text(
                  "8076150746",
                  style: TextStyle(
                    fontSize: 10.0
                  )
                ),
              ],
            )

          ],
        )
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: Column(
            children: [
              _buildContainer(
                icon: Icons.dashboard,
                label: "My Dashboard",
                onTap: () {}
              ),
              _buildContainer(
                icon: Icons.person,
                label: "Manage Child",
                onTap: () {
                  Navigator.pushNamed(context, AddNewChild.routeName);
                }
              ),
              _buildContainer(
                icon: Icons.file_copy_rounded,
                label: "Common Form",
                onTap: () {}
              ),
              _buildContainer(
                icon: Icons.favorite,
                label: "Shortlisted Schools",
                onTap: () {}
              ),
              const SizedBox(
                height: 20.0,
              ),
              _buildContainer(
                icon: Icons.qr_code_scanner,
                label: "Scan QR Code",
                onTap: () {}
              ),
              _buildContainer(
                icon: Icons.headset_mic_rounded,
                label: "Need Help?",
                seeMore: false,
                onTap: () {}
              ),
              _buildContainer(
                icon: Icons.star,
                label: "Rate our App",
                seeMore: false,
                onTap: () {}
              ),
              _buildContainer(
                icon: Icons.notifications,
                label: "Notification Settings",
                seeMore: false,
                onTap: () {}
              ),
            ],
          ),
        ),
      )
    );
  }
}
