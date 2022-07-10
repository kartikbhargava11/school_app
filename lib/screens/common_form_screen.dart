import 'package:flutter/material.dart';

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

  final Map<String, String> _formValues = {
    "bloodGroup": "",
    "motherTongue": "",
    "nationality": "",
    "religion": "",
    "category": ""
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
            const SizedBox(
              height: 25.0,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              color: Colors.white,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
