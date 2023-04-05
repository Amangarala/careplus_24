// ignore_for_file: prefer_const_constructors, implementation_imports, unnecessary_import, camel_case_types, sort_child_properties_last, non_constant_identifier_names, unused_import, unrelated_type_equality_checks, unused_local_variable, constant_identifier_names

import 'package:careplus_24/Access/home.dart';
import 'package:careplus_24/Access/login.dart';
import 'package:careplus_24/Access/option01.dart';
import 'package:careplus_24/Firebase/user.dart';
import 'package:careplus_24/Access/verifymail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../firebase_options.dart';

class signup extends StatefulWidget {
  static String email = "";
  static String username = "";

  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

void checkSignUp() async {
  bool isSignedUp = true;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("Up", isSignedUp);
}

class _signupState extends State<signup> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/signup.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.25,
                right: 35,
                left: 20,
              ),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.supervised_user_circle_rounded),
                          hintText: 'Username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      controller: _usernameTextController,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("Username cannot be empty");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please Enter valid name(Min .3 Character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _usernameTextController.text = value!;
                      },
                      onChanged: (value) => {
                        signup.username = value,
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'E-mail',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return (" Please Enter your E-mail");
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid E-mail");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _emailTextController.text = value!;
                      },
                      onChanged: (value) {
                        signup.email = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: 'New Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      controller: _passwordTextController,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please Enter valid Password(Min .6 Character)");
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _passwordTextController.text = value!;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      controller: _confirmPasswordTextController,
                      validator: (value) {
                        if (_confirmPasswordTextController.text !=
                            _passwordTextController.text) {
                          return "Password don't match";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _confirmPasswordTextController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        //  checkSignUp();
                        if (formkey.currentState!.validate()) {
                          await Firebase.initializeApp(
                            options: DefaultFirebaseOptions.currentPlatform,
                          );
                          final email = _emailTextController.text;
                          final password = _passwordTextController.text;

                          final username = _usernameTextController.text;
                          final UserCredintial = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password)
                              .then((value) => {postDetailsToFirestore()})
                              .catchError((e) {
                            Fluttertoast.showToast(msg: e!.message);
                          });
                        }
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        fixedSize: Size(400, 60),
                        primary: Color(0xff2e30f1),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? ',
                            style: TextStyle(
                              color: Colors.black87,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const login())));
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

//   postDetailsToFirestore() async {
//     //Calling firestore

//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//     //Calling our user model
//     User? user = FirebaseAuth.instance.currentUser;
//     UserModel userModel = UserModel();

//     //Writing all values

//     userModel.email = user!.email;
//     userModel.uid = user.uid;
//     userModel.userName = _usernameTextController.text;

//     await firebaseFirestore
//         .collection("users")
//         .doc(user.uid)
//         .set(userModel.toMap());

//     Fluttertoast.showToast(msg: "Account created successfully");

//     Navigator.pushAndRemoveUntil(
//         (context),
//         MaterialPageRoute(builder: (context) => doctorPatient()),
//         (route) => false);
//   }
// }
//   String id = DateTime.now().millisecondsSinceEpoch.toString();
  postDetailsToFirestore() async {
    // final fireStore = FirebaseFirestore.instance.collection("details");
    // User? user = FirebaseAuth.instance.currentUser;
    // UserModel userModel = UserModel();

    // userModel.email = user!.email;
    // userModel.uid = user.uid;
    // userModel.userName = _usernameTextController.text;

    // await fireStore.doc(id).set(userModel.toMap());
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => doctorPatient()),
        (route) => false);
  }
}
