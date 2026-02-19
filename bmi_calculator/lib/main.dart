import 'package:bmi_calculator/const_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  double userHeight = 30;
  double userWeight = 1;
  int userAge = 1;
  double userBMI = 0.0;
  String bmiMessage = "";
  bool isMale = true;
  Color defaultColor = Color(0xFF24263B);
  Color selectedColor = Color(0xFF333244);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        backgroundColor: Color(0xFF24263B),
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "semibold",
          ),
        ),
        centerTitle: true,
      ),
    
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .center,
              children: [
                // male icon
                Expanded(
                  child: InkWell(
                    onTap: () {
                      isMale = true;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isMale ? selectedColor : defaultColor,
                      ),
                      width: 155,
                       height: 180,
                      child: Column(
                        children: [
                          SvgPicture.asset("images/male.svg"),
                          Text("Male", style: TextStyle(color: Color(0xFF8B8C9E))),
                           SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // female icon
                Expanded(
                  child: InkWell(
                    onTap: () {
                      isMale = false;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: !isMale ? selectedColor : defaultColor,
                      ),
                      width: 155,
                       height: 180,
                      child: Column(
                        children: [
                          SvgPicture.asset("images/female.svg"),
                          Text(
                            "Female",
                            style: TextStyle(color: Color(0xFF8B8C9E)),
                          ),
                           SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(height: 20),
        
            // height container.
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF333244),
                ),
                 height: 210,
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                    ),
                    
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          userHeight.toStringAsFixed(0),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ],
                    ),
                    
                    Slider(
                      min: 30,
                      max: 200,
                      value: userHeight,
                      onChanged: (value) {
                        userHeight = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(height: 20),
        
            Row(
              mainAxisAlignment: .center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF333244),
                    ),
                    width: 155,
                     height: 180,
                        
                    child: Column(
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                        ),
                        Text(
                          userWeight.toStringAsFixed(0),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              // 8B8C9E
                              InkWell(
                                onTap: () {
                                  if (userWeight > MIN_WEIGHT) userWeight--;
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  if (userWeight < MAX_WEIGHT) userWeight++;
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF333244),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 155,
                     height: 180,
                    child: Column(
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                        ),
                        Text(
                          userAge.toStringAsFixed(0),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              // 8B8C9E
                              InkWell(
                                onTap: () {
                                  if (userAge > MIN_AGE) userAge--;
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  if (userAge <= MAX_AGE) userAge++;
                                  setState(() {});
                                },
                                child: CircleAvatar(
                                  radius: 25,
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          userBMI = userWeight / (userHeight / 100) * (userHeight / 100);
    
          if (userBMI < 18.5) {
            bmiMessage = "Underweight";
          } else if (userBMI <= 24.9 && userBMI >= 18.5) {
            bmiMessage = "Healthy Weight";
          } else if (userBMI <= 29.9 && userBMI >= 25) {
            bmiMessage = "Overweight";
          } else {
            bmiMessage = "Obesity";
          }
    
          Widget okButton = TextButton(
            child: Text("OK"),
            onPressed: () {
              bmiMessage = "";
              userBMI = 0;
              Navigator.of(context).pop();
            },
          );
    
          // set up the AlertDialog
          AlertDialog alert = AlertDialog(
            title: Text("Your BMI"),
            content: Text(bmiMessage),
            actions: [okButton],
          );
    
          // show the dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
        child: Container(
          height: 80,
          color: Color(0xFFE83D67),
          child: Center(
            child: Text(
              "Calculate",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
