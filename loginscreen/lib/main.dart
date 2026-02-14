
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: .start,
            children: [
              SizedBox(
                width: 400,
                height: 350,
                child: Image.network(
                  "https://media.istockphoto.com/id/1413769770/vector/login-page-for-website-linear-icon.webp?s=2048x2048&w=is&k=20&c=jHkGR0H_wY6Qt-un0nHLIf5tv8cshehDyzLXU02rc8A=",
                ),
              ),
              Column(
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Text("Welcome To Little Drop, where", style: TextStyle(fontSize: 20),),
                  Text("you manage your daily tasks.", style: TextStyle(fontSize: 20),),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 250,
                height: 40,
                decoration: BoxDecoration(
                  border: BoxBorder.all(color: Colors.deepPurple),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text("Sign up using"),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: .center,

                children: [
                  CircleAvatar(child: Image.network("https://images.seeklogo.com/logo-png/30/1/facebook-icon-logo-png_seeklogo-306459.png"),),
                  SizedBox(width: 10,),
                  CircleAvatar(child: Image.network("https://logos-world.net/wp-content/uploads/2020/11/Google-Plus-Logo.png"),),
                  SizedBox(width: 10,),
                  CircleAvatar(child: Image.network("https://images.icon-icons.com/2429/PNG/512/linkedin_logo_icon_147268.png"),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
