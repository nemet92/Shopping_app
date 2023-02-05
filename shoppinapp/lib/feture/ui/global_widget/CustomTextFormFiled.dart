import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {super.key,
      required this.username,
      required this.hintText,
      this.prefixIcon});

  final TextEditingController username;
  String hintText;
  Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: username,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 16.sp),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          enabledBorder: const OutlineInputBorder()),
    );
  }
}
