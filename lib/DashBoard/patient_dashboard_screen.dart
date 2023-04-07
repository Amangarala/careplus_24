// ignore_for_file: camel_case_types

import 'package:careplus_24/Access/home.dart';
import 'package:flutter/material.dart';

class patientdashboardscreen extends StatefulWidget {
  const patientdashboardscreen({Key? key}) : super(key: key);

  @override
  State<patientdashboardscreen> createState() => _patientdashboardscreenState();
}

class _patientdashboardscreenState extends State<patientdashboardscreen> {
  get controllerOne => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xffd2fcff),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/home_scrren_bg.png',
              fit: BoxFit.cover,
            ),
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15, left: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
                        },
                        child: const Hero(
                          tag: 'usericon',
                          child: Icon(
                            Icons.account_circle_rounded,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: const Text(
                        'care plus 24',
                        style: TextStyle(
                            color: Color(0xff2e30f1),
                            fontSize: 24,
                            decoration: TextDecoration.none,
                            fontFamily: 'SourceSansPro',
                            letterSpacing: 1),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 70, top: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
                        },
                        child: const Icon(
                          Icons.settings,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1,
                        right: 0,
                      ),
                      child: const Text(
                        'we care your health',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18,
                            color: Color(0xff2e36ff),
                            fontFamily: 'SourceSansPro',
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: Image.asset(
                    'assets/images/final first block 1.png',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 90, top: 100),
                  child: const Text(
                    'BOOK APPOIMENT',
                    style: TextStyle(
                      color: Color(0xff0c3f64),
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 324, top: 125.0),
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }));
                    }),
                    child: const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 300, top: 100),
                  child: const VerticalDivider(
                    thickness: .2,
                    endIndent: 640,
                    color: Color.fromARGB(255, 15, 15, 15),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 240),
                  child: Image.asset(
                    'assets/images/second block final.png',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 90, top: 260),
                  child: const Text(
                    'SET REMINDER',
                    style: TextStyle(
                      color: Color(0xff0c3f64),
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 310, left: 90),
                  child: const Text(
                    '3:00 pm\nafter lunch',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff3b3a3a),
                        fontFamily: 'SourceSansPro',
                        letterSpacing: 1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 295, left: 190),
                  child: const Text(
                    'next time\n7:00 pm\nafter lunch',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff3b3a3a),
                        fontFamily: 'SourceSansPro',
                        letterSpacing: 1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 300, top: 270),
                  child: const VerticalDivider(
                    thickness: .2,
                    endIndent: 470,
                    color: Color.fromARGB(255, 15, 15, 15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 324, top: 295.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }));
                    },
                    child: const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 400),
                  child: Image.asset(
                    'assets/images/third block final 1.png',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 90, top: 420),
                  child: const Text(
                    'MY VISIT',
                    style: TextStyle(
                      color: Color(0xff0c3f64),
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 450, left: 90),
                  child: const Text(
                    'DR.ANURAG DALSANIYA\n17-JAN-2023\nwednesday',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff3b3a3a),
                        fontFamily: 'SourceSansPro',
                        letterSpacing: 1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 300, top: 450),
                  child: const VerticalDivider(
                    thickness: .2,
                    endIndent: 310,
                    color: Color.fromARGB(255, 15, 15, 15),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 324, top: 450.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }));
                    },
                    child: const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 105, left: 5),
              child: Image.asset(
                'assets/images/first block icon.png',
                width: 70,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 270, left: 5),
              child: Image.asset(
                'assets/images/second block icon.png',
                width: 70,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 435, left: 5),
              child: Image.asset(
                'assets/images/third block icon.png',
                width: 70,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 560, left: 20),
              child: const Text(
                'our specilist',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18,
                    color: Color(0xff2e36ff),
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 1),
              ),
            ),
            //specilist doctors
            Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              controller: controllerOne,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: controllerOne,
                itemCount: 2,
                primary: true,
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Home();
                          }));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 465),
                          child: const CircleAvatar(
                            backgroundColor: Color(0xffbee4ff),
                            radius: 40,
                            backgroundImage: AssetImage(
                                'assets/images/circle avtar icon.png'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 600, left: 0),
                      child: const Text(
                        'DR.Anurag',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          color: Color(0xff3b3a3a),
                          fontFamily: 'SourceSansPro',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const Home();
                    })));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 740),
                    child: const Image(
                      image: AssetImage('assets/images/doctor.png'),
                      width: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const Home();
                    })));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 740),
                    child: const Image(
                      image: AssetImage('assets/images/blood donation.png'),
                      width: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const Home();
                    })));
                  },
                  child: Container(
                      margin: const EdgeInsets.only(top: 740),
                      child: const Icon(
                        Icons.home,
                        size: 40,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const Home();
                    })));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 740),
                    child: const Image(
                      image: AssetImage('assets/images/shopping-cart.png'),
                      width: 40,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const Home();
                    })));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 740),
                    child: const Image(
                      image: AssetImage('assets/images/ayurveda.png'),
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
