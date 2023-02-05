import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.color,
      required this.sideColor});
  final Widget text;
  final Color color;
  final Color sideColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(side: BorderSide(color: sideColor)))),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(child: text),
        ));
  }
}
