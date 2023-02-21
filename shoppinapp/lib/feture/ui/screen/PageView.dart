// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:shoppinapp/feture/ui/screen/cart/cart.dart';
// import 'package:shoppinapp/feture/ui/screen/search/search.dart';
// import 'package:shoppinapp/feture/ui/screen/settings/settings.dart';

// import 'home/home.dart';

// class PageViewPage extends StatefulWidget {
//   const PageViewPage({super.key});

//   @override
//   State<PageViewPage> createState() => _PageViewPageState();
// }

// class _PageViewPageState extends State<PageViewPage> {
//   int _selectedIndex = 0;
//   final PageController _pageController = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Baki seheri"),
//       ),
//       drawer: const Drawer(),
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height * 0.95,
//         child: PageView(
//           onPageChanged: (page) {
//             setState(() {
//               _selectedIndex = page;
//             });
//           },
//           controller: _pageController,
//           children: const [
//             HomePage(),
//             SearchPage(),
//             SettingsPage(),
//             CartPage()
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: _onTappedBar,
//           selectedItemColor: Colors.black,
//           items: const [
//             BottomNavigationBarItem(
//               backgroundColor: Colors.red,
//               label: "Home",
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: "Search",
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: "Cart",
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: "Settings",
//               icon: Icon(
//                 Icons.home,
//               ),
//             )
//           ]),
//     );
//   }

//   void _onTappedBar(int value) {
//     setState(() {
//       _selectedIndex = value;
//     });
//     _pageController.jumpToPage(value);
//   }
// }
