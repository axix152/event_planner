import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const.dart';

class TextFiled extends StatelessWidget {
  const TextFiled({
    Key? key,
    required this.controller,
    // ignore: non_constant_identifier_names
    required this.hint_Text,
    required this.prefexicon,
    required this.secureText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint_Text;
  final Icon prefexicon;
  final bool secureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 7.h,
        left: 10.w,
        right: 10.w,
        bottom: 7.h,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: secureText,
        decoration: InputDecoration(
          prefixIcon: prefexicon,
          hintText: hint_Text,
          hintStyle: const TextStyle(
            color: kblackColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
        ),
      ),
    );
  }
}
