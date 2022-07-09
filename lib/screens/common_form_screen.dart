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
            )
          ],
        )
      )
    );
  }
}
