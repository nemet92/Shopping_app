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
      required this.items,
      required this.onSelected});

  final List<PopUpMenuBarItem> items;
  final IconData baseIscon;
  final Color iconColor;
  final Function onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        icon: Icon(
          baseIscon,
          color: iconColor,
        ),
        onSelected: onSelected(),
        itemBuilder: (context) => [
              for (var i = 0; i < items.length; i++)
                PopupMenuItem(
                  child: Row(
                    children: [items[i].tralling, Text(items[i].title)],
                  ),
                ),
            ]);
  }
}
