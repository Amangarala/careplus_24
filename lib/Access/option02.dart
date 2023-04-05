// ignore_for_file: camel_case_types, deprecated_member_use, prefer_const_constructors, sort_child_properties_last, unused_local_variable, unused_element, unused_import

import 'package:careplus_24/Access/home.dart';
import 'package:careplus_24/Access/login.dart';
import 'package:careplus_24/Access/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

// bool? islogg;
// bool? isSignUp;

class options extends StatefulWidget {
  const options({Key? key}) : super(key: key);

  @override
  State<options> createState() => _optionsState();
}

class _optionsState extends State<options> {
  checkOptions() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    int isvisited = 0;
    await prefer.setInt("Options", isvisited);
  }
  // loginInfo() async {
  //   SharedPreferences prefin = await SharedPreferences.getInstance();
  //   islogg = prefin.getBool('Log');
  // }

  // signUpInfo() async {
  //   SharedPreferences prefup = await SharedPreferences.getInstance();
  //   isSignUp = prefup.getBool('Up');
  // }

  @override
  // void initState() {
  // ignore: todo
  //   // TODO: implement initState
  //   super.initState();
  //   // loginInfo();
  //   // signUpInfo();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/home01.png'),
            fit: BoxFit.cover,
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //checkOptions();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => signup()));
                      //Get.to(signup());
                    },
                    child: const Text(
                      'create new account',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      fixedSize: Size(300, 65),
                      primary: Colors.white,
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkOptions();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => login()));
                      // Get.to(login());
                    },
                    child: const Text(
                      'login to existing account',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      primary: Colors.white,
                      fixedSize: Size(300, 65),
                      padding: EdgeInsets.all(20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
