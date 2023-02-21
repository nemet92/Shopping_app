import 'package:flutter/material.dart';
import 'package:shoppinapp/feture/ui/global_widget/custom_navigation_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomNavigationBar2(),
      body: Container(
        color: Colors.yellow,
        child: const Text("cartx"),
      ),
    );
  }
}
