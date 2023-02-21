import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PopUpMenuBarItem {
  final String title;
  final Widget tralling;

  PopUpMenuBarItem(this.title, this.tralling);
}

class PopMenuBar extends StatelessWidget {
  const PopMenuBar(
      {super.key,
      required this.baseIscon,
      required this.iconColor,
      required this.items});

  final List<PopUpMenuBarItem> items;
  final IconData baseIscon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        icon: Icon(
          baseIscon,
          color: iconColor,
        ),
        itemBuilder: (context) => [
              for (var i = 0; i < items.length; i++)
                PopupMenuItem(
                  child: Row(
                    children: [items[i].tralling, Text(items[i].title).tr()],
                  ),
                ),
            ]);
  }
}
