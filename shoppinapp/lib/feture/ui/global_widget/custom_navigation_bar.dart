import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppinapp/feture/ui/screen/cart/cart.dart';
import 'package:shoppinapp/feture/ui/screen/search/search.dart';
import 'package:shoppinapp/feture/ui/screen/settings/settings.dart';

import '../screen/home/home.dart';

class CustomNavigationBar2 extends StatefulWidget {
  const CustomNavigationBar2({
    super.key,
    // required int selectedNavbar,
  });

  @override
  State<CustomNavigationBar2> createState() => _CustomNavigationBar2State();
}

class _CustomNavigationBar2State extends State<CustomNavigationBar2> {
  // MobxStateManagement mobxStateManagement = MobxStateManagement();

  // @override
  // void initState() {
  //   super.initState();

  //   _selectedNavbar;
  //   _changeSelectedNavBar(_selectedNavbar);
  // }

  late int _selectedNavbar = 0;

  _changeSelectedNavBar(int value) {
    setState(() {});
    _selectedNavbar = value;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        // mouseCursor: MouseCursor.uncontrolled,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        showSelectedLabels: true,
        // selectedIconTheme: const IconThemeData(color: Colors.red),
        showUnselectedLabels: true,
        // selectedLabelStyle: const TextStyle(color: Colors.red),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 20.sp,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: Colors.white,
                size: 20.sp,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.badge_sharp,
                color: Colors.white,
                size: 20.sp,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20.sp,
              ),
              label: "Setting")
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        // showUnselectedLabels: true,
        onTap: (value) {
          {
            setState(() {});
            _selectedNavbar = value;
            // print("set$_selectedNavbar");
          }
          if (value == 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
            // mobxStateManagement.changeIndex(value);
            _changeSelectedNavBar(value);
            // print(value);
            // print(_selectedNavbar);
          } else {
            if (value == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => SearchPage()));
              _changeSelectedNavBar(value);

              // mobxStateManagement.changeIndex(value);
            } else {
              if (value == 2) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
                _changeSelectedNavBar(2);
                _changeSelectedNavBar(value);
                // mobxStateManagement.changeIndex(value);
              } else {
                if (value == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                  _changeSelectedNavBar(3);
                  // mobxStateManagement.changeIndex(value);
                }
              }
            }
          }
        });
  }
}
