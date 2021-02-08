import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      BallPage(),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text(
            'Ask Me Anything',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.blue[800],
        ),
        body: Magic8Ball(),
      ),
    );
  }
}

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int answer = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          setState(() {
            answer = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset('images/ball$answer.png'),
      ),
    );
  }
}
