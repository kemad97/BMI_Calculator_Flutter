import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled5/AppColors.dart';
import 'package:untitled5/results_calculator.dart';
import 'package:untitled5/reusable_card.dart';

import 'bmi_brain.dart';
import 'consts.dart';
import 'icon_card_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 20;

  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? AppColors.activeCardColor
                        : AppColors.inactiveCardColor,
                    cardChild: IconCardContent(
                      icon: FontAwesomeIcons.mars,
                      txt: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? AppColors.activeCardColor
                        : AppColors.inactiveCardColor,
                    cardChild: IconCardContent(
                      icon: FontAwesomeIcons.venus,
                      txt: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: AppColors.activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height", style: Constants.labelStyleText),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,

                    children: [
                      Text(height.toString(), style: Constants.labelNumberText),
                      Text(
                        "CM",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.lightTextGrey,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    max: 240,
                    min: 120,
                    activeColor: AppColors.accent,
                    inactiveColor: AppColors.lightTextGrey,
                    onChanged: (value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: AppColors.activeCardColor,
                    cardChild: CounterCard(
                      text: "Weight in Kg",
                      value: weight,
                      onIncrement: () => setState(() {
                        weight++;
                      }),
                      onDecrement: () => setState(() {
                        weight--;
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: AppColors.activeCardColor,
                    cardChild: CounterCard(
                      text: "Age",
                      value: age,
                      onIncrement: () => setState(() {
                        age++;
                      }),
                      onDecrement: () => setState(() {
                        age--;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMICalcBrain calc = BMICalcBrain(height: height, weight: weight);
              String bmiResult = calc.calculateBMI();
              String result = calc.getResult();
              String interpretation = calc.getInterpretation();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsScreen(
                    bmiResult: bmiResult,
                    resultText: result,
                    interpretation: interpretation,
                  ),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              color: AppColors.accent,
              margin: EdgeInsets.only(top: 16.0),
              height: Constants.bottomContainerHeight,
              child: Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.text,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.onPress, required this.icon});
  final VoidCallback? onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon, color: AppColors.text),
      elevation: 4.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: AppColors.inactiveCardColor,
    );
  }
}

class CounterCard extends StatelessWidget {
  final String text;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CounterCard({
    super.key,
    required this.text,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        Text(value.toString(), style: Constants.labelNumberText),
        SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(icon: FontAwesomeIcons.minus, onPress: onDecrement),
            SizedBox(width: 16.0),
            RoundIconButton(icon: FontAwesomeIcons.plus, onPress: onIncrement),
          ],
        ),
      ],
    );
  }
}
