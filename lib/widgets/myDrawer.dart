import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../global.dart';
import '../screens/authentication/login.dart';

class MyDrawer extends StatefulWidget {
  String? name;
  String? email;

  MyDrawer({
    this.name,
    this.email,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: sort_child_properties_last
      child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink.shade300,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    size: 50.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    widget.name.toString(),
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    widget.email.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Edit Detials',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Update Profiles',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onTap: () {
                fauth.signOut();
                Get.offAll(LogIn());
              },
            ),
          ]),
    );
  }
}
