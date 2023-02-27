// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {super.key,
      required this.usernameController,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      required bool validator,
      this.onChanged,
      this.errorText})
      : _validator = validator;

  final TextEditingController usernameController;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool _validator;
  final String? errorText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      onChanged: (value) {
        onChanged;
      },
      obscureText: obscureText,
      controller: usernameController,
      decoration: InputDecoration(
          errorText: _validator ? errorText : null,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
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
