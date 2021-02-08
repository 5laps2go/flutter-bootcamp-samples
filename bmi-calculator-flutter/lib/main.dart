import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090D20),
        scaffoldBackgroundColor: Color(0xFF090D20),
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Color(0xFFBDBEB8),
            inactiveTrackColor: Color(0xFF8D8E98),
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x1FEB1555),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
      ),
      home: InputPage(),
    );
  }
}
