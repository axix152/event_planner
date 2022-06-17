import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const.dart';

class ProgressDialog extends StatelessWidget {
  final String? message;
  // ignore: use_key_in_widget_constructors
  const ProgressDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.pink.shade300,
      child: Container(
        margin: EdgeInsets.all(16.h),
        decoration: BoxDecoration(
          color: kwhiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.h),
          child: Row(
            children: [
              SizedBox(
                width: 6.w,
              ),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink.shade400),
              ),
              SizedBox(
                width: 26.w,
              ),
              Text(
                message!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
