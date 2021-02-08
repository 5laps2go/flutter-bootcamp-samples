import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Xylophone(),
        ),
      ),
    );
  }
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  void playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  List<Widget> buildKeys() {
    List<Widget> keys = [];
    var keyColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.teal,
      Colors.green,
      Colors.blue,
      Colors.purple
    ];
    for (int i = 0; i < 7; i++) {
      keys.add(
        Expanded(
          child: FlatButton(
            onPressed: () {
              playSound(i + 1);
            },
            color: keyColors[i],
          ),
        ),
      );
    }
    return keys;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buildKeys(),
    );
  }
}
