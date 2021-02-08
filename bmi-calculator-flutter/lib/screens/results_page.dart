import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

import '../components/bottom_action_button.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.calculator});

  final CalculatorBrain calculator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text('Your Result', style: kResultTitleStyle),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(calculator.getAnswer(), style: kResultStyle),
                  Text(
                    calculator.calculateBMI(),
                    style: kBMINumberStyle,
                  ),
                  Text(
                    calculator.getCritique(),
                    style: kBMICritiqueStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomActionButton(
            title: 'RE-Calculate',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
