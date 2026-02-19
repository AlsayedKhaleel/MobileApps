import 'dart:collection';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isObscure = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Welcome to our",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              "grocery shop",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 196, 196),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15, bottom: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Name"),
                        TextFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            hintText: "Name",
                          ),
                          controller: nameController,
                        ),
                      ],
                    ),

                    Container(height: 10),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Phone Number"),
                        TextFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),

                            hintText: "phone",
                          ),
                          controller: phoneController,
                        ),
                      ],
                    ),
                    Container(height: 10),

                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text("Password"),
                        TextField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),

                            suffix: IconButton(
                              iconSize: 20.0,
                              icon: _isObscure
                                  ?
                                   const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  :
                                   const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
