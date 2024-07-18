import 'dart:async';

import 'package:flutter/material.dart';
import 'package:post/constant/app_constant.dart';
import 'package:post/constant/app_style.dart';
import 'package:post/feature/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  void changeScreen() async {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(
              color: AppStyle.primary,
            ),
          ),
          const SizedBox(height: AppStyle.mediumInsets),
          Text(
            AppString.settingUp,
            style: AppStyle.noramlStyle(),
          ),
        ],
      ),
    );
  }
}
