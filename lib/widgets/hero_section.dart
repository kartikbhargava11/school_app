import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {

  const HeroSection({Key? key}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Material(
                elevation: 2.0,
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    hintText: "Which School are you looking?",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.red,
                  ),
                ),
              )
            ],
          )
        ),
        const SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Text(
                "Schools in Delhi",
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: -1.2,
                )
              ),
              Spacer(),
              Text(
                "View all 1788 schools",
                style: TextStyle(
                  color: Colors.blue
                )
              )
            ],
          ),
        ),
      ],
    );
  }
}
