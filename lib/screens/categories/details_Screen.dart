import 'package:event_planner/const.dart';
import 'package:event_planner/global.dart';
import 'package:event_planner/widgets/custom_Button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String name;
  final String phone;
  final String image;
  final String id;
  final String email;

  DetailScreen({
    required this.title,
    required this.price,
    required this.description,
    required this.name,
    required this.phone,
    required this.image,
    required this.id,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    requestDetails() {
      Map request = {
        "id": userModel!.id,
        "name": userModel!.name,
        "email": userModel!.email,
      };
      print(request);
      DatabaseReference ref =
          FirebaseDatabase.instance.ref().child("serviceProvider");
      ref
          .child(id)
          .child("request")
          .child(userModel!.id.toString())
          .set(request);
      Fluttertoast.showToast(msg: "Request has been sent sucessfully");
      Get.back();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 280.h,
              width: double.infinity,
              color: Colors.red,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Text(
                    "$price Rs",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Text(
                "Name: $name",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Text(
                "Phone: $phone",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Text(
                "Email: $email",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Custom_Button(
                  title: "Request",
                  onpressed: () {
                    requestDetails();
                  },
                  color: kprimarryColor,
                  textColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
