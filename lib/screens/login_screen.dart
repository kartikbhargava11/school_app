import 'dart:io';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          height: MediaQuery.of(context).size.height - appBar.preferredSize.height,
          child: Column(
            children: [
              const Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  )
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0)
                      ),
                      child: const Center(
                          child: Image(
                            image: NetworkImage(
                                "https://1000logos.net/wp-content/uploads/2016/10/Apple-Logo.png"
                            ),
                            fit: BoxFit.cover,
                          )
                      )
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      height: 60,
                      width: 120,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0)
                      ),
                      child: const Center(
                          child: Image(
                            image: NetworkImage(
                                "https://1000logos.net/wp-content/uploads/2016/11/New-Google-Logo.jpg"
                            ),
                            fit: BoxFit.cover,
                          )
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                "or",
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: "Email / Mobile No."
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: "Password"
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Colors.blue,
                        )
                      )
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 24.0
                          )
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0
                        )
                      ),
                      const SizedBox(
                        width: 2.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.0
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Platform.isIOS ? 48.0 : 12.0,
              )
            ],
          ),
        )
      )
    );
  }
}
