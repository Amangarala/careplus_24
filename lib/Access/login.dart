// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, unused_element, dead_code, unused_local_variable, await_only_futures, unused_import

import 'package:careplus_24/Access/home.dart';
import 'package:careplus_24/Access/option01.dart';
import 'package:careplus_24/Access/reset_password.dart';
import 'package:careplus_24/Access/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:careplus_24/Package/package';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

void checkLogin() async {
  bool isLoggedIn = true;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("Log", isLoggedIn);
}

class _loginState extends State<login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/login.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.30,
                right: 35,
                left: 20,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'Enter your E-mail ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
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
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40))),
                      controller: _passwordTextController,
                      autofocus: false,
                      obscureText: true,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Please Enter valid Password(Min .6 Character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _passwordTextController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const resetpassword())));
                          },
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        //checkLogin();
                        if (formKey.currentState!.validate()) {
                          final user = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text)
                              .then((uid) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const doctorPatient())));
                            Fluttertoast.showToast(msg: "Login Successful");
                          }).catchError((e) {
                            Fluttertoast.showToast(msg: e!.message);
                          });
                        }
                      },
                      child: const Text(
                        'LOG IN',
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
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.black87,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const signup())));
                          },
                          child: Text(
                            'Sign Up',
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
}
