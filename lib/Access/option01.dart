// ignore_for_file: camel_case_types, unnecessary_import, implementation_imports

import 'package:careplus_24/Profile/doctorProfile.dart';
import 'package:careplus_24/Profile/patientProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class doctorPatient extends StatefulWidget {
  const doctorPatient({Key? key}) : super(key: key);

  @override
  State<doctorPatient> createState() => _doctorPatientState();
}

class _doctorPatientState extends State<doctorPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2e30f1),
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose your side',
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Alkatra',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const DoctorsProfile())));
                },
                child: Ink.image(
                  image: const AssetImage('assets/images/doctorprofile.png'),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Doctor\'s side',
              style: TextStyle(
                fontFamily: 'Alkatra',
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const PatientsProfile())));
                },
                child: Ink.image(
                  image: const AssetImage('assets/images/patientprofile.png'),
                  height: 200,
                  width: 200,
                )),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Patient\'s side',
              style: TextStyle(
                fontFamily: 'Alkatra',
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
