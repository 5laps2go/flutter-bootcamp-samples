import 'package:flutter/material.dart';

import '../constants.dart';

class BottomActionButton extends StatelessWidget {
  const BottomActionButton({
    Key key,
    @required this.onTap,
    @required this.title,
  }) : super(key: key);

  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(title, style: kBottomActionStyle),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
