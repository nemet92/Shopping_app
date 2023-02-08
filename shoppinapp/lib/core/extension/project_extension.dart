import 'package:flutter/material.dart';

enum ImagePath { delivery, grocery, maskGroup2 }

// enum ImagePathSvg { maskGroup }

//png
extension ImagePathExtesion on ImagePath {
  String get toPath => "assets/$name.png";
  Image get toImage => Image.asset(toPath);
}

// //Svg
// extension ImagePathExtesionSvg on ImagePathSvg {
//   String get toPath => "assets/svg/$name.svg";
//   Image get toImageSvg => Image.asset(toPath);
// }
