// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shoppinapp/core/mobx/mobx_view_model.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  MobxStateManagement mobxStateManagement = MobxStateManagement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: const Text("Search"))),
      ),
    );
  }
}
