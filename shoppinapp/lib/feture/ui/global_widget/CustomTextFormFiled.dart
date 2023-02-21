// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      required this.username,
      required this.hintText,
      this.sufixIcon,
      this.prefixIcon,
      this.obscureText = false});

  final TextEditingController username;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: username,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16.sp),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder()),
    );
  }
}
