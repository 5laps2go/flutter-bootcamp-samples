import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/constants.dart';

class CounterLabel extends StatelessWidget {
  const CounterLabel({
    Key key,
    @required this.onMinusPressed,
    @required this.onPlusPressed,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  final Function onMinusPressed;
  final Function onPlusPressed;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: kLabelTextStyle),
        Text(value, style: kInputTextStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundIconButton(
              onPressed: onMinusPressed,
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: 15.0,
            ),
            RoundIconButton(
              onPressed: onPlusPressed,
              icon: FontAwesomeIcons.plus,
            ),
          ],
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 20.0,
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
