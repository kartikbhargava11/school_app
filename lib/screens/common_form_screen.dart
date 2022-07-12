import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CommonFormScreen extends StatefulWidget {
  static const routeName = "/common-form";
  const CommonFormScreen({Key? key}) : super(key: key);

  @override
  State<CommonFormScreen> createState() => _CommonFormScreenState();
}

class _CommonFormScreenState extends State<CommonFormScreen> {
  final List<Map<String, dynamic>> _tabs = [
    {
      "name": "Child Details",
      "active": true,
    },
    {
      "name": "Parent & Guardian Details",
      "active": false,
    },
    {
      "name": "Address & Contact Details",
      "active": false,
    },
    {
      "name": "Photos & Documents",
      "active": false,
    }
  ];

  final List<Map<String, String>> _motherTongue = [
    {
      "name": "Select Mother Tongue",
      "value": ""
    },
    {
      "name": "Hindi",
      "value": "1",
    },
    {
      "name": "English",
      "value": "2",
    },
    {
      "name": "Bengali",
      "value": "3",
    },
    {
      "name": "Marathi",
      "value": "4",
    },
  ];

  final List<Map<String, String>> _bloodGroups = [
    {
      "name": "Select Blood Group",
      "value": ""
    },
    {
      "name": "A+",
      "value": "A+"
    },
    {
      "name": "B+",
      "value": "B+"
    },
    {
      "name": "AB+",
      "value": "AB+"
    },
    {
      "name": "O+",
      "value": "O+"
    },
    {
      "name": "A-",
      "value": "A-"
    },
    {
      "name": "B-",
      "value": "B-"
    },
    {
      "name": "AB-",
      "value": "AB-"
    },
    {
      "name": "O-",
      "value": "O-"
    },
  ];

  final _nationalities = [
    {
      "name": "Select Nationality",
      "value": ""
    },
    {
      "name": "Indian",
      "value": "1"
    },
    {
      "name": "Other",
      "value": "2"
    },
  ];

  final _religions = [
    {
      "name": "Select Religion",
      "value": ""
    },
    {
      "name": "Hinduism",
      "value": "1"
    },
    {
      "name": "Islam",
      "value": "2"
    },
    {
      "name": "Sikhism",
      "value": "3"
    },
    {
      "name": "Buddhism",
      "value": "4"
    },
    {
      "name": "Jainism",
      "value": "5"
    },
    {
      "name": "Other",
      "value": "6"
    },
  ];

  final _category = [
    {
      "name": "Select Category",
      "value": ""
    },
    {
      "name": "General",
      "value": "1"
    },
    {
      "name": "SC",
      "value": "2"
    },
    {
      "name": "ST",
      "value": "3"
    },
    {
      "name": "OBC",
      "value": "4"
    },
    {
      "name": "Other",
      "value": "5"
    },
  ];

  final _isMinority = [
    {
      "name": "Select Minority",
      "value": ""
    },
    {
      "name": "Yes",
      "value": "1"
    },
    {
      "name": "No",
      "value": "2"
    },
  ];
  final _childBornOrder = [
    {
      "name": "Select",
      "value": ""
    },
    {
      "name": "Only/Single Child (No Siblings)",
      "value": "1"
    },
    {
      "name": "First/Eldest/Twin Child",
      "value": "2"
    },
    {
      "name": "Second/Twin Child",
      "value": "3"
    },
    {
      "name": "Third Child",
      "value": "4"
    },
    {
      "name": "Fourth Child",
      "value": "5"
    },
    {
      "name": "None of the Above",
      "value": "6"
    },
  ];

  final _isOrphan = [
    {
      "name": "Select",
      "value": ""
    },
    {
      "name": "Adopted",
      "value": "1"
    },
    {
      "name": "Orphan",
      "value": "2"
    },
    {
      "name": "No",
      "value": "3"
    },
  ];

  final Map<String, String> _formValues = {
    "bloodGroup": "",
    "motherTongue": "",
    "nationality": "",
    "religion": "",
    "category": "",
    "minority": "",
    "childBornOrder": "",
    "isOrphanOrAdopted": "",
  };

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 18.0
      )
    );
  }

  Widget _buildSizedBox(double height) {
    return SizedBox(height: height);
  }

  Widget _buildDropdownButton({ required String value, required List<Map<String, String>> items, required String key }) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        isDense: true,
        border: OutlineInputBorder()
      ),
      value: value,
      items: items.map((element) {
        return DropdownMenuItem(
          value: element["value"],
          child: Text(element["name"] ?? "Unknown"),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _formValues[key] = newValue ?? "";
        });
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text(
          "Common Form"
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: Text(
                "Common Form",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0
                )
              )
            ),
            Container(
              height: 40,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _tabs.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: _tabs[index]["active"] == true ? Colors.red : Colors.transparent,
                          width: 2.0
                        )
                      )
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Text(
                      _tabs[index]["name"],
                      style: TextStyle(
                        fontSize: 16.0,
                        color: _tabs[index]["active"] == true ? Colors.red : Colors.black,
                      )
                    )
                  );
                },
              )
            ),
            _buildSizedBox(16.0),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Form Filled: 0%",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 24,
                    lineHeight: 15.0,
                    percent: 0.1,
                    progressColor: Colors.green,
                  ),
                ],
              )
            ),
            _buildSizedBox(16.0),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "You are applying for",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Child Name",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              )
                            ),
                            Text(
                              "Aiden Sharma",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Child Gender",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              )
                            ),
                            Text(
                              "Boy",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold
                              )
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                                "Class",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                )
                            ),
                            Text(
                                "Class 1",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                                "Date of Birth",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                )
                            ),
                            Text(
                                "08/07/2015",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ),
            _buildSizedBox(16.0),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              color: Colors.white,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel("Blood Group"),
                    _buildSizedBox(10.0),
                    _buildDropdownButton(
                      value: _formValues["bloodGroup"] ?? "",
                      items: _bloodGroups,
                      key: "bloodGroup"
                    ),
                    _buildSizedBox(25.0),
                    _buildLabel("Mother Tongue"),
                    _buildSizedBox(10.0),
                    _buildDropdownButton(
                      value: _formValues["motherTongue"] ?? "",
                      items: _motherTongue,
                      key: "motherTongue"
                    ),
                    _buildSizedBox(25.0),
                    _buildLabel("Nationality"),
                    _buildSizedBox(10.0),
                    _buildDropdownButton(
                      value: _formValues["nationality"] ?? "",
                      items: _nationalities,
                      key: "nationality"
                    ),
                    _buildSizedBox(25.0),
                    _buildLabel("Religion"),
                    _buildSizedBox(10.0),
                    _buildDropdownButton(
                      value: _formValues["religion"] ?? "",
                      items: _religions,
                      key: "religion"
                    ),
                    _buildSizedBox(25.0),
                    _buildLabel("Category"),
                    _buildSizedBox(10.0),
                    _buildDropdownButton(
                      value: _formValues["category"] ?? "",
                      items: _category,
                      key: "category"
                    ),
                    _buildSizedBox(25.0),
                    _buildLabel("Minority"),
                    _buildSizedBox(10.0),
                    _buildDropdownButton(
                      value: _formValues["minority"] ?? "",
                      items: _isMinority,
                      key: "minority"
                    ),
                    _buildSizedBox(25.0),
                    _buildLabel("Child Born Order"),
                    _buildSizedBox(10.0),
                    _buildDropdownButton(
                        value: _formValues["childBornOrder"] ?? "",
                        items: _childBornOrder,
                        key: "childBornOrder"
                    ),
                    _buildSizedBox(25.0),
                    _buildLabel("Is child Adopted/Orphan"),
                    _buildSizedBox(10.0),
                    _buildDropdownButton(
                        value: _formValues["isOrphanOrAdopted"] ?? "",
                        items: _isOrphan,
                        key: "isOrphanOrAdopted"
                    ),
                    _buildSizedBox(25.0),
                    Align(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Text("Cancel")
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Next")
                          ),
                        ],
                      )
                    )
                  ],
                ),
              )
            )
          ],
        )
      )
    );
  }
}
