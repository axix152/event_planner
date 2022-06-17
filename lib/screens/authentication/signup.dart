import 'package:event_planner/global.dart';
import 'package:event_planner/screens/authentication/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../const.dart';
import '../../widgets/circal_button_login_signup.dart';
import '../../widgets/textFormField.dart';
import '../../widgets/progress_dialog.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameCont = TextEditingController();
    TextEditingController phoneCont = TextEditingController();
    TextEditingController emailCont = TextEditingController();
    TextEditingController passwordCont = TextEditingController();

    saveUserInfoNow() async {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return const ProgressDialog(message: "Processing,Please wait...");
        },
      );
      final User? firebaseUser = (await fauth
              .createUserWithEmailAndPassword(
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
        Map userMap = {
          "id": firebaseUser.uid,
          "name": nameCont.text.trim(),
          "email": emailCont.text.trim(),
          "phone": phoneCont.text.trim(),
        };

        DatabaseReference usersRef =
            FirebaseDatabase.instance.ref().child("users");
        usersRef.child(firebaseUser.uid).set(userMap);

        currentFirebaseUser = firebaseUser;
        Fluttertoast.showToast(msg: "Account has been Created.");

        Get.to(LogIn());
      } else {
        Get.back();
        Fluttertoast.showToast(msg: "Account has not been Created.");
      }
    }

    validateForm() {
      if (nameCont.text.length < 3) {
        Fluttertoast.showToast(msg: "Name must be atleast 3 Characters.");
      } else if (!emailCont.text.contains("@")) {
        Fluttertoast.showToast(msg: "Email address is not valid.");
      } else if (phoneCont.text.isEmpty) {
        Fluttertoast.showToast(msg: "Phone Number is required.");
      } else if (passwordCont.text.length < 6) {
        Fluttertoast.showToast(msg: "password must be atleast 6 Characters.");
      } else {
        saveUserInfoNow();
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150.h,
                width: 200.w,
                child: Image.asset(
                  'assets/images/signup_logo.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 300.w,
                    color: kwhiteColor,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.h),
                            child: const Text(
                              "signup As Host",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: kprimarryColor,
                              ),
                            ),
                          ),
                          TextFiled(
                            controller: nameCont,
                            hint_Text: "Enter Name",
                            secureText: false,
                            prefexicon: Icon(
                              Icons.person,
                              size: 25.w,
                              color: kblackColor,
                            ),
                          ),
                          TextFiled(
                            controller: emailCont,
                            hint_Text: "Enter email",
                            secureText: false,
                            prefexicon: Icon(
                              Icons.email,
                              size: 25.w,
                              color: kblackColor,
                            ),
                          ),
                          TextFiled(
                            controller: phoneCont,
                            hint_Text: "Enter Phone number",
                            secureText: false,
                            prefexicon: Icon(
                              Icons.phone,
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
                            height: 20.h,
                          ),
                          circal_button_login_signup(
                            onpressed: () {
                              validateForm();
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have account?"),
                              TextButton(
                                  onPressed: () {
                                    Get.to(LogIn());
                                  },
                                  child: const Text("Login"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
