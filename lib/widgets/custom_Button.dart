import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custom_Button extends StatelessWidget {
  const Custom_Button({
    Key? key,
    required this.title,
    required this.onpressed,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  final String title;
  final VoidCallback onpressed;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 250.w,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0, color: textColor),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
              side: const BorderSide(
                color: Colors.pink,
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
