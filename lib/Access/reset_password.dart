// ignore_for_file: camel_case_types, prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, unused_element, dead_code, no_logic_in_create_state, unused_field, unused_import, deprecated_member_use

import 'package:careplus_24/Access/home.dart';
import 'package:careplus_24/Access/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailTextController = TextEditingController();
  late String _email;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/resetpassword.jpeg'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.40,
                right: 35,
                left: 20,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      onChanged: ((value) {
                        setState(() {
                          _email = value;
                        });
                      }),
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(email: _email);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Send Request',
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
