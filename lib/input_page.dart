import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled5/AppColors.dart';
import 'package:untitled5/reusable_card.dart';

import 'consts.dart';
import 'icon_card_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;

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
                Expanded(child: ReusableCard(color: AppColors.activeCardColor)),
                Expanded(child: ReusableCard(color: AppColors.activeCardColor)),
              ],
            ),
          ),
          Container(
            color: AppColors.accent,
            margin: EdgeInsets.only(top: 16.0),
            height: Constants.bottomContainerHeight,
          ),
        ],
      ),
    );
  }

  // void updateCardColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == AppColors.activeCardColor) {
  //       maleCardColor = AppColors.inactiveCardColor;
  //       femaleCardColor = AppColors.activeCardColor;
  //     } else {
  //       maleCardColor = AppColors.activeCardColor;
  //     }
  //   } else if (selectedGender == Gender.female) {
  //     if (femaleCardColor == AppColors.activeCardColor) {
  //       maleCardColor = AppColors.activeCardColor;
  //       femaleCardColor = AppColors.inactiveCardColor;
  //     } else {
  //       femaleCardColor = AppColors.activeCardColor;
  //     }
  //   }
  // }
}
