import 'package:flutter/material.dart';

class SchoolProfileApplyToClasses extends StatelessWidget {
  final List<Map<String, String>> formDetails;
  SchoolProfileApplyToClasses({
    required this.formDetails,
    Key? key}) : super(key: key);

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.blue[200],
      ),
      child: Row(
        children: [
          const Text(
            "Online Application Form",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            )
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Session",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                "2022-2023",
                style: TextStyle(
                  fontSize: 14.0,
                )
              ),
            ],
          )
        ],
      )
    );
  }


  final List<Widget> _buildClasses = [];


  @override
  Widget build(BuildContext context) {
    for (var index = 0; index < formDetails.length; index++) {
      final Map<String, String> form = formDetails[index];
      _buildClasses.add(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${form['class']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    )
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Application Fees :",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0
                            )
                          ),
                          Text(
                            "Rs. ${form['fees']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0
                            )
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Last Date :",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.0
                            )
                          ),
                          Text(
                            "${form['lastDate']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: const Text(
                        "Add to Apply",
                        style: TextStyle(
                          color: Colors.red,
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (index != formDetails.length - 1)
            const Divider(
              height: 1.0,
              color: Colors.grey,
            )
          ],
        )
      );
    }

    return Column(
      children: [
        _buildHeader(),
        ..._buildClasses
      ],
    );
  }
}
