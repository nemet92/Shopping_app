import 'package:flutter/material.dart';
import 'package:shoppinapp/core/mobx/mobx_view_model.dart';

import '../../global_widget/custom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MobxStateManagement mobxStateManagement = MobxStateManagement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: const Text("home Page"),
      ),
      bottomNavigationBar: const CustomNavigationBar2(),
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
