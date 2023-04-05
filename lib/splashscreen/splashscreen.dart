// ignore_for_file: annotate_overrides, prefer_const_constructors, unused_import, file_names, unused_local_variable

import 'dart:async';
import 'package:careplus_24/Access/login.dart';
import 'package:careplus_24/Access/option02.dart';
import 'package:careplus_24/DashBoard/patient_dashboard_screen.dart';
import 'package:careplus_24/Onbordingscreen/onbording.dart';
import 'package:careplus_24/Access/home.dart';
import 'package:careplus_24/Profile/doctorProfile.dart';
import 'package:careplus_24/Profile/patientProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;
int? isvisited;
bool? islogg;
bool? isSignUp;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      onBoardInfo();
      // optionsInfo();
      // loginInfo();
      // signUpInfo();

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => isViewed != 0 ? OnbordingScreen() : options(),
      ));

      // if (isViewed == 0 &&
      //     isvisited == 0 &&
      //     islogg == true &&
      //     isSignUp == true) {
      //   Get.offAll(Home());
      // }
      // if (isViewed != 0) {
      //   Get.offAll(OnbordingScreen());
      // }
      // if (islogg != true) {
      //   Get.offAll(login());
      // }
    });
  }

  onBoardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isViewed = prefs.getInt('onBoard');
  }

  // optionsInfo() async {
  //   SharedPreferences prefer = await SharedPreferences.getInstance();
  //   isvisited = prefer.getInt('Options');
  // }

  // loginInfo() async {
  //   SharedPreferences prefin = await SharedPreferences.getInstance();
  //   islogg = prefin.getBool('Log');
  // }

  // signUpInfo() async {
  //   SharedPreferences prefup = await SharedPreferences.getInstance();
  //   isSignUp = prefup.getBool('Up');
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                height: 200,
                width: 200,
                image: AssetImage(
                  'assets/images/CarePlus 24 logo.png',
                ),
              ),
            ]),
      ),
    );
  }
}
