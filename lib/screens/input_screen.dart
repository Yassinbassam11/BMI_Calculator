import 'package:bmi_starter/consts/app_colors.dart';
import 'package:bmi_starter/screens/result_screen.dart';
import 'package:bmi_starter/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String gender = 'male';
  double height = 180;
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: kActiveColor,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: gender == 'male'
                        ? kFloatingActionButtonColor
                        : kCardColor,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          gender = 'male';
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.male, size: 65),
                          Text(
                            'MALE',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: gender == 'female'
                        ? kFloatingActionButtonColor
                        : kCardColor,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          gender = 'female';
                        });
                      },
                      child: Column(
                        children: [
                          Icon(Icons.female, size: 65),
                          Text(
                            'FEMALE',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: height.round().toString(),
                                style: TextStyle(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: ' cm',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                          activeColor: kButtonColor,
                          value: height,
                          min: 120,
                          max: 220,
                          onChanged: (value) {
                            height = value.round().toDouble();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "$weight kg",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[700],
                                ),
                                child: Icon(Icons.remove, color: Colors.white),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[700],
                                ),
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "$age",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[700],
                                ),
                                child: Icon(Icons.remove, color: Colors.white),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[700],
                                ),
                                child: Icon(Icons.add, color: Colors.white),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //width: double.infinity,
                  margin: const EdgeInsets.all(12.0),
                  child: Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(0),
                        // ),
                      ),
                      onPressed: () {
                        double bmi = weight / ((height / 100) * (height / 100));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(result: bmi),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'CALCULATE',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
