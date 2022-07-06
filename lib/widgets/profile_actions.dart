import 'package:flutter/material.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({Key? key}) : super(key: key);

  Widget _buildCircularButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 1.0,
          ),
          shape: BoxShape.circle
      ),
      child: Icon(
        icon,
        color: color,
        size: 24.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Text(
                      "Compare"
                  ),
                ),
                const Spacer(),
                _buildCircularButton(
                  Icons.calculate,
                  Colors.black,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                _buildCircularButton(
                  Icons.notifications,
                  Colors.blueAccent,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                _buildCircularButton(
                  Icons.favorite_border_outlined,
                  Colors.red,
                ),
              ],
            ),
            const Divider(),
            const Text(
                "Official Application Partner",
                style: TextStyle(
                    fontSize: 12.0
                )
            )
          ],
        )
    );
  }
}
