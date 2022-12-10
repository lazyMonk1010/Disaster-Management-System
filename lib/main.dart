import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sahyog/currently_working/global_variables.dart';
import 'package:sahyog/currently_working/pages/chose_category_page.dart';
import 'package:sahyog/currently_working/pages/civilian/civil_login_page.dart';
import 'package:sahyog/currently_working/pages/civilian/civil_signup_page.dart';
import 'package:sahyog/currently_working/pages/civilian/civilian_homepage.dart';
import 'package:sahyog/currently_working/pages/splash_screen_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SahYog',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: GV.primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      home: AllButtons(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AllButtons extends StatelessWidget {
  const AllButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(SplashScreenPage());
              },
              child: Text('Splash screen')),
          ElevatedButton(
              onPressed: () {
                Get.to(CivilLoginPage());
              },
              child: Text('Civilian LoginPage')),
          ElevatedButton(
              onPressed: () {
                Get.to(CivilSignupPage());
              },
              child: Text('Civilian Signup Page')),
          ElevatedButton(
              onPressed: () {
                Get.to(CivilHomePage());
              },
              child: Text('Civilian Home Page')),
        ],
      )),
    );
  }
}
