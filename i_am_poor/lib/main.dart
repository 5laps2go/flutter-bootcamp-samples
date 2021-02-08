import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('flower'),
          toolbarOpacity: 0.5,
        ),
        body: Center(
          child: Image(
            image: AssetImage(
              'images/sunflower.jpeg',
            ),
          ),
        ),
        backgroundColor: Colors.amber[300],
      ),
    ),
  );
}
