// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {key,
      required this.text,
      required this.color,
      required this.sideColor,
      required this.onPressed})
      : super(key: key);
  final Widget text;
  final Color color;
  final Color sideColor;
  Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(side: BorderSide(color: sideColor)))),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(child: text),
        ));
  }
}
