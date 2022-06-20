import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  CategoryItem({required this.title, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            width: double.infinity,
            child: Image.network(
              image,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "$price Rs",
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
