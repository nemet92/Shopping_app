import 'package:flutter/material.dart';
import 'package:shoppinapp/feture/ui/screens/home/home_screen.dart';

const String homeRoute = "/";

class CustomRouter {
  static Route<dynamic>? allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
    return null;
  }
}
