import 'package:event_planner/screens/authentication/login.dart';
import 'package:event_planner/screens/authentication/signup.dart';
import 'package:event_planner/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'screens/splashScreen/splash_Screeen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: '/splashScreen',
        getPages: [
          GetPage(name: '/splashScreen', page: () => SplashScreen()),
          GetPage(name: '/login', page: () => LogIn()),
          GetPage(name: '/signup', page: () => SignUp()),
          GetPage(name: '/mainScreen', page: () => MainScreen()),
        ],
      ),
    );
  }
}
