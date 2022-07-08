import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Gender { boy, girl }

extension ParseToString on Gender {
  String toShortString() {
    return toString().split('.').last;
  }
}


class AddNewChild extends StatefulWidget {
  static const routeName = "/add-new-child";
  const AddNewChild({Key? key}) : super(key: key);

  @override
  State<AddNewChild> createState() => _AddNewChildState();
}

class _AddNewChildState extends State<AddNewChild> {
  final _standards = [
    {
      "name": "Pre-Nursery",
      "active": false,
    },
    {
      "name": "Nursery",
      "active": false,
    },
    {
      "name": "Prep",
      "active": false,
    },
    {
      "name": "Class 1",
      "active": false,
    },
    {
      "name": "Class 2",
      "active": false,
    },
    {
      "name": "Class 3",
      "active": false,
    },
    {
      "name": "Class 4",
      "active": false,
    },
    {
      "name": "Class 5",
      "active": false,
    },
    {
      "name": "Class 6",
      "active": false,
    },
    {
      "name": "Class 7",
      "active": false,
    },
  ];
  final _form = GlobalKey<FormState>();

  final TextEditingController _childNameTextEditingController = TextEditingController();
  final TextEditingController _preferredClassTextEditingController = TextEditingController();
  final TextEditingController _datePickerTextEditingController = TextEditingController();
  Gender? childGender;

  final Map<String, String> _formValues = {
    "selectedDate": "",
    "childName": "",
    "preferredClass": "",
    "childGender": "",
  };


  void _saveForm() {
    print(_formValues);
  }

  void _setGender(Gender? value) {
    _formValues["childGender"] = value == null ? "" : value.toShortString();
    setState(() {
      childGender = value;
    });
  }

  void _showBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            height: 550,
            child: SingleChildScrollView(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _standards.length + 1,
                itemBuilder: (ctx, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 4.0, left: 16.0, right: 16.0),
                      child:  Text(
                        "Select Class",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    );
                  }
                  final Map<String, dynamic> standard = _standards[index - 1];
                  return InkWell(
                    onTap: () {
                      _preferredClassTextEditingController
                        ..text = standard["name"]
                        ..selection = TextSelection.fromPosition(TextPosition(
                            offset: _preferredClassTextEditingController.text.length,
                            affinity: TextAffinity.upstream)
                        );

                      _formValues["preferredClass"] = standard["name"];
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            standard["name"],
                            style: TextStyle(
                              color: standard["active"] == true ? Colors.blue : Colors.grey,
                              fontSize: 16.0
                            )
                          ),
                          const Spacer(),
                          if (standard["active"] == true)
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 24.0,
                            )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
              )
            )
          )
        );
      }
    );
  }

  void _showCalendar(BuildContext ctx) async {
    final currentDate = DateTime.now();
    final DateTime? selected = await showDatePicker(
      context: ctx,
      initialDate: currentDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025)
    );
    if (selected != null) {
      _datePickerTextEditingController
        ..text = DateFormat.yMMMd().format(selected)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _datePickerTextEditingController.text.length,
            affinity: TextAffinity.upstream)
        );

      _formValues["selectedDate"] = selected.toString();

    }
  }

  @override
  void dispose() {
    _preferredClassTextEditingController.dispose();
    _datePickerTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        title: const Text(
          "Add New Child"
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                border: Border.all(
                  color: Colors.yellow[700] as Color,
                  width: 1.0
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.yellow[700]
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  const Flexible(
                    child: Text(
                      "Please fill these details very carefully. Updating Child profile data after submitting the Application will not change the details in Application",
                    ),
                  ),
                ],
              )
            ),
            const SizedBox(
              height: 8.0,
            ),
            Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        hintText: "What's your Child's Full Name?",
                      ),
                      controller: _childNameTextEditingController,
                      onChanged: (_) {
                        _formValues["childName"] = _childNameTextEditingController.text;
                      },
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    const Text(
                      "Your Child's Gender",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0
                      )
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Radio<Gender>(
                          value: Gender.boy,
                          groupValue: childGender,
                          onChanged: (Gender? value) {
                            _setGender(value);
                          },
                        ),
                        Text(
                          "BOY"
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Radio<Gender>(
                          value: Gender.girl,
                          groupValue: childGender,
                          onChanged: (Gender? value) {
                            _setGender(value);
                          },
                        ),
                        Text(
                          "GIRL"
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    TextFormField(
                      controller: _preferredClassTextEditingController,
                      onTap: () => _showBottomSheet(context),
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: "Preferred Class",
                        suffixIcon: Icon(Icons.keyboard_arrow_down)
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    TextFormField(
                      controller: _datePickerTextEditingController,
                      onTap: () => _showCalendar(context),
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: "Date of Birth of Child?",
                        suffixIcon: Icon(Icons.calendar_month)
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: _saveForm,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                            child: Text("Submit"),
                          )
                      ),
                    )
                  ],
                )
              ),
            )
          ],
        ),
      )
    );
  }
}
