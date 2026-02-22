
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
  TextEditingController confirmPasswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 196, 196),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),

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
                SizedBox(height: 150),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 15,
                      right: 15,
                      bottom: 20,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("Name"),
                              TextFormField(
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                validator: (value) {
                                  return value == "" ? "Invalid name." : null;
                                },
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
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                validator: (value) {
                                  return value!.contains(RegExp(r'[a-zA-Z]')) ||
                                          value == ""
                                      ? "Invalid phone"
                                      : null;
                                },
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
                              TextFormField(
                                controller: passwdController,
                                obscureText: _isObscure,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                validator: (value) {
                                  return value!.length < 5 || value == ""
                                      ? "Invalid password"
                                      : null;
                                },
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
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          )
                                        : const Icon(
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
                          SizedBox(height: 10,),
                          Column(
                            crossAxisAlignment: .start,
                            children: [
                              Text("Confirm Password"),
                              TextFormField(
                                controller: confirmPasswdController,
                                obscureText: _isObscure,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                                validator: (value) {
                                  return value != passwdController.text
                                      ? "password not match"
                                      : null;
                                },
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
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("Sign UP", style: TextStyle(fontSize: 20)),
                              Spacer(),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: InkWell(
                                    onTap: () {},
                                    child: Icon(Icons.arrow_forward),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
