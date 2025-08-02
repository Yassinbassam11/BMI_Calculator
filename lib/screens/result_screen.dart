import 'package:bmi_starter/consts/app_colors.dart';
import 'package:bmi_starter/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final double result;
  // ignore: prefer_const_constructors_in_immutables
  ResultScreen({super.key, required this.result});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String resultText = '';

  @override
  void initState() {
    resultText = getResultText();
    super.initState();
  }

  String getResultText() {
    if (widget.result <= 18.5) {
      return 'Underweight';
    } else if (widget.result <= 24.9) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        centerTitle: true,
        backgroundColor: kActiveColor,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableCard(
              child: Column(
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.result.toStringAsFixed(1),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                  ),
                  Text('Normal BMI range is 18.5 - 24.9'),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kButtonColor,
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(0),
                            // ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              'RECALCULATE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
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
          ],
        ),
      ),
    );
  }
}
