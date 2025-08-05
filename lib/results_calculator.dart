import 'package:flutter/material.dart';
import 'package:untitled5/AppColors.dart';
import 'package:untitled5/consts.dart';
import 'package:untitled5/reusable_card.dart';

class ResultsScreen extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsScreen({
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Result")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.directional(start: 16.0, top: 4.0),
            child: Text(
              "Your Result",
              style: Constants.titleTextStyle,
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: AppColors.activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText, style: Constants.resultTextStyle),
                  Text(bmiResult, style: Constants.bmiTextStyle),
                  Padding(
                    padding: EdgeInsetsGeometry.all(2.0),
                    child: Text(
                      interpretation,
                      style: Constants.bodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: AppColors.accent,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
