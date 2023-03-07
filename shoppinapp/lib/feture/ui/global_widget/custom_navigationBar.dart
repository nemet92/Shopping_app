import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:shoppinapp/classes/language/localization_constants.dart';
import 'package:shoppinapp/core/mobx/mobx_view_model.dart';
import 'package:shoppinapp/feture/ui/screens/settings/settings_screen.dart';

import '../screens/cart/cart_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/search/search_screen.dart';

class GlobalNavigationBar extends StatefulWidget {
  const GlobalNavigationBar({super.key});

  @override
  State<GlobalNavigationBar> createState() => _GlobalNavigationBarState();
}

class _GlobalNavigationBarState extends State<GlobalNavigationBar> {
  MobxStateManagement mobxStateManagement = MobxStateManagement();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          const HomeScreen(),
          SearchScreen(),
          const CartScreen(),
          const SettingScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedIconTheme: const IconThemeData(color: Colors.black26),
        unselectedLabelStyle: const TextStyle(color: Colors.black26),
        unselectedItemColor: Colors.black26,
        selectedIconTheme: const IconThemeData(color: Colors.red),
        currentIndex: index,
        onTap: (int newindex) {
          setState(() {
            index = newindex;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.home,
            ),
            label: getTranslated(context, "home"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: getTranslated(context, "search"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(FontAwesome.cart_plus),
            label: getTranslated(context, "cart"),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: getTranslated(context, "setting"),
          ),
        ],
      ),
    );
  }
}
