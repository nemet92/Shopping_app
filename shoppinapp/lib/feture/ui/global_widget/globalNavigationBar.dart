import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:shoppinapp/core/mobx/mobx_view_model.dart';
import 'package:shoppinapp/feture/ui/screen/home/home_page.dart';
import 'package:shoppinapp/feture/ui/screen/settings/settings.dart';

import '../screen/cart/cart.dart';
import '../screen/search/search.dart';

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
          const HomePage(),
          SearchPage(),
          const CartPage(),
          const SettingsPage(),
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.red,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.cart_plus),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({
//     super.key,
//     required this.mobxStateManagement,
//   });

//   final MobxStateManagement mobxStateManagement;

//   @override
//   Widget build(BuildContext context) {
//     return Observer(builder: (_) {
//       return BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.red,
//           currentIndex: mobxStateManagement.currentIndex,
//           // _selectedIndex,
//           onTap: (index) {
//             if (index == 1) {
//               context.navigateToPage(SearchPage());
//               // mobxStateManagement.changeIndex(index);
//             } else if (index == 0) {
//               context.navigateToPage(const HomePage());
//               // mobxStateManagement.changeIndex(index);
//             }
//           }
//           // (value) {
//           //   if (value == 0) {
//           //     Navigator.pushReplacement(
//           //         context, MaterialPageRoute(builder: (_) => const HomePage()));
//           //     _changeSelectedBar(value);
//           //   } else {
//           //     if (value == 1) {
//           //       Navigator.pushReplacement(context,
//           //           MaterialPageRoute(builder: (_) => const SearchPage()));
// //  ;})         //       _changeSelectedBar(value);
//           //     }
//           //   }
//           // },
//           ,
//           selectedItemColor: Colors.black,
//           items: const [
//             BottomNavigationBarItem(
//               label: "Home",
//               icon: Icon(Icons.home),
//             ),
//             BottomNavigationBarItem(
//               label: "Search",
//               icon: Icon(Icons.search),
//             ),
//             BottomNavigationBarItem(
//               label: "Cart",
//               icon: Icon(Icons.card_travel),
//             ),
//             BottomNavigationBarItem(
//               label: "Settings",
//               icon: Icon(
//                 Icons.home,
//               ),
//             )
//           ]);
//     });
//   }
// }
