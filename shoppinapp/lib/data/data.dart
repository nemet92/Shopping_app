import 'package:flutter/material.dart';

class Catagory {
  final String name;
  final List<Product>? products;
  Catagory({required this.name, this.products});
}

class Product {
  final String name;
  final String image;
  final String price;
  final String isSelected;
  final Color color;
  final Color nutrientsColor;
  final List<List<String>> nutrients;

  Product(this.name, this.image, this.price, this.isSelected, this.color,
      this.nutrientsColor, this.nutrients);
}

final data = [Catagory(name: "Fast Food", products: [])];
