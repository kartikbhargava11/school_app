import 'package:flutter/material.dart';

class ClassesList extends StatelessWidget {
  final List<Map<String, String>> _forms = [
    {
      "id": "1",
      "class": "Pre-Nursery",
      "fees": "25",
      "lastDate": "31 Aug, 2022 11:59 PM"
    },
    {
      "id": "2",
      "class": "Nursery",
      "fees": "25",
      "lastDate": "31 Aug, 2022 11:59 PM"
    },
    {
      "id": "3",
      "class": "Prep",
      "fees": "25",
      "lastDate": "31 Aug, 2022 11:59 PM"
    }
  ];

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: const BoxDecoration(
        color: Colors.blue,
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




  ClassesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (var index = 0; index < _forms.length; index++) {
      final Map<String, String> form = _forms[index];
      _buildClasses.add(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
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
            if (index != _forms.length - 1)
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
