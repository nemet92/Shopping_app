import 'package:flutter/material.dart';
import 'package:shoppinapp/feture/ui/screen/settings/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: const Text("home Page"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          currentIndex: _selectedIndex,
          onTap: _onTappedBar,
          selectedItemColor: Colors.black,
          items: [
            const BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            const BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.home),
            ),
            const BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              icon: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage())),
                child: const Icon(
                  Icons.home,
                ),
              ),
            )
          ]),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
