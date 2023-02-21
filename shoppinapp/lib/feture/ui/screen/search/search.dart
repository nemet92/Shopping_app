// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shoppinapp/core/mobx/mobx_view_model.dart';
import 'package:shoppinapp/feture/ui/global_widget/custom_navigation_bar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  MobxStateManagement mobxStateManagement = MobxStateManagement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: Center(
          child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: const Text("Search"))),
      bottomNavigationBar: const CustomNavigationBar2(),
    );
  }
}
