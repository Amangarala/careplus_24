// ignore_for_file: unnecessary_import, implementation_imports, unused_import, empty_statements, deprecated_member_use, prefer_const_constructors, use_build_context_synchronously

import 'package:careplus_24/Access/home.dart';
import 'package:careplus_24/Access/login.dart';
import 'package:careplus_24/Access/option01.dart';
import 'package:careplus_24/Access/option02.dart';
import 'package:careplus_24/Access/signup.dart';
import 'package:careplus_24/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  List onBoardingdata = [
    {
      "image": 'assets/images/onboarding_01.png',
    },
    {
      "image": 'assets/images/onboarding_02.png',
    },
    {
      "image": 'assets/images/onboarding_03.png',
    },
  ];
  Color whiteColor = Colors.white;
  Color otherColor = const Color(0xFF191730);
  PageController pageController = PageController();
  continueMethod() async {
    await _storeOnBoardInfo();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const options()),
        result: (route) => false);
  }

  int currentPage = 0;
  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("onBoard", isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: null,
      body: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              itemCount: onBoardingdata.length,
              onPageChanged: onChanged,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(onBoardingdata[index]['image']),
                  ],
                );
              }),
          Padding(
            padding: const EdgeInsets.only(bottom: 140),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (currentPage == (onBoardingdata.length - 1))
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: continueMethod,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                fixedSize: Size(200, 65),
                                primary: Color(0xff2e30f1),
                                padding: EdgeInsets.all(20),
                              ),
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                          onBoardingdata.length,
                          (index) {
                            return AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              height: 10,
                              width: (index == currentPage) ? 25 : 20,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (index == currentPage)
                                    ? const Color.fromARGB(255, 5, 23, 221)
                                    : Colors.grey,
                              ),
                            );
                          },
                        ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
