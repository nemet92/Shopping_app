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
      this.obscureText = false,
      required bool validator,
      this.errorText})
      : _validator = validator;

  final TextEditingController username;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool obscureText;
  final bool _validator;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: username,
      decoration: InputDecoration(
          errorText: _validator ? errorText : null,
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16.sp),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: const OutlineInputBorder()),
    );
  }
}
