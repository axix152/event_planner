import 'package:event_planner/global.dart';
import 'package:event_planner/screens/authentication/signup.dart';
import 'package:event_planner/screens/splashScreen/splash_Screeen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../const.dart';
import '../../widgets/progress_dialog.dart';
import '../../widgets/textFormField.dart';
import '../../widgets/circal_button_login_signup.dart';

// ignore: camel_case_types
class LogIn extends StatelessWidget {
  Widget build(BuildContext context) {
    TextEditingController emailCont = TextEditingController();
    TextEditingController passwordCont = TextEditingController();
    logInUserNow() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return const ProgressDialog(message: "Processing,Please wait...");
        },
      );
      final User? firebaseUser = (await fauth
              .signInWithEmailAndPassword(
        email: emailCont.text.trim(),
        password: passwordCont.text.trim(),
      )
              .catchError(
        (msg) {
          Get.back();
          Fluttertoast.showToast(msg: "Error: " + msg.toString());
        },
      ))
          .user;

      if (firebaseUser != null) {
        DatabaseReference usersRef =
            FirebaseDatabase.instance.ref().child("users");
        usersRef.child(firebaseUser.uid).once().then((keyvalue) {
          final snap = keyvalue.snapshot;
          if (snap.value != null) {
            currentFirebaseUser = firebaseUser;
            Fluttertoast.showToast(msg: "Login Successful.");
            Get.offAll(SplashScreen());
          } else {
            Get.back();
            Fluttertoast.showToast(msg: "Failed to login.");
          }
        });
      }
    }

    validateForm() {
      if (!emailCont.text.contains("@")) {
        Fluttertoast.showToast(msg: "Email address is not valid.");
      } else if (passwordCont.text.isEmpty) {
        Fluttertoast.showToast(msg: "password is required.");
      } else {
        logInUserNow();
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Event Planner",
            style: TextStyle(
              color: kwhiteColor,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: kprimarryColor,
        ),
        backgroundColor: kprimarryColor,
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  height: 150.h,
                  width: 200.w,
                  child: Image.asset(
                    'assets/images/logIn_logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 320.h,
                    width: 300.w,
                    color: kwhiteColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.h),
                          child: const Text(
                            "Login As Host",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: kprimarryColor,
                            ),
                          ),
                        ),
                        TextFiled(
                          controller: emailCont,
                          hint_Text: "Enter email",
                          secureText: false,
                          prefexicon: Icon(
                            Icons.person,
                            size: 25.w,
                            color: kblackColor,
                          ),
                        ),
                        TextFiled(
                          controller: passwordCont,
                          hint_Text: "Enter password",
                          secureText: true,
                          prefexicon: Icon(
                            Icons.password,
                            size: 25.w,
                            color: kblackColor,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        circal_button_login_signup(
                          onpressed: () {
                            validateForm();
                          },
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have account?"),
                            TextButton(
                                onPressed: () {
                                  Get.to(SignUp());
                                },
                                child: const Text("Signup"))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
