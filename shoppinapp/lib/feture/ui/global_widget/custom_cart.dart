import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.onPressed,
    required this.leadingIcon,
    required this.title,
    this.trailing,
  });

  final Function() onPressed;
  final Widget leadingIcon;
  final Text? title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        style: ListTileStyle.drawer,
        iconColor: Colors.red,
        onTap: onPressed,
        minLeadingWidth: 1,
        trailing: trailing,
        // const Icon(
        //   Icons.chevron_right,
        //   color: Colors.black54,
        // ),
        leading: leadingIcon,
        title: title,
      ),
    );
  }
}
