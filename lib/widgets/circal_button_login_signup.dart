import 'package:flutter/material.dart';
import '../const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class circal_button_login_signup extends StatelessWidget {
  const circal_button_login_signup({
    required this.onpressed,
    Key? key,
  }) : super(key: key);
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25.r,
      backgroundColor: kprimarryColor,
      child: IconButton(
        onPressed: onpressed,
        icon: Icon(
          Icons.arrow_forward,
          color: kwhiteColor,
          size: 25.w,
        ),
      ),
    );
  }
}
