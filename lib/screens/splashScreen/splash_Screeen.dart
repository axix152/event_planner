import 'dart:async';

import 'package:event_planner/global.dart';
import 'package:event_planner/screens/main_screen.dart';
import 'package:event_planner/screens/authentication/login.dart';
import 'package:event_planner/screens/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/custom_Button.dart';
import '../../const.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    // fauth.currentUser != null ? AssistantModel.readCurrentUserInfo() : null;
    // fauth.currentUser != null ? AssistantModel.currentUserDetails() : null;
    Timer(const Duration(seconds: 4), () async {
      if (await fauth.currentUser != null) {
        Get.offAll(MainScreen());
      } else {
        Get.to(LogIn());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150.h,
              width: 150.w,
              child: Image.asset('assets/images/splashLogo.png'),
            ),
            SizedBox(
              height: 2.h,
            ),
            const Text(
              "Event Planner",
              style: TextStyle(
                fontSize: 30.0,
                color: kprimarryColor,
              ),
            ),
            const Text(
              "Host",
              style: TextStyle(
                fontSize: 30.0,
                color: kprimarryColor,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
