import 'package:event_planner/global.dart';
import 'package:event_planner/screens/authentication/login.dart';
import 'package:event_planner/widgets/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Custom_Button(
            title: "Logout",
            onpressed: () {
              fauth.signOut();
              Get.offAll(LogIn());
            },
            color: Colors.lightGreenAccent,
            textColor: Colors.black),
      ),
    );
  }
}
