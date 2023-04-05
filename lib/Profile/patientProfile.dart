// ignore_for_file: prefer_const_literals_to_create_immutables

// ignore: unused_import
import 'package:careplus_24/Access/home.dart';
import 'package:careplus_24/Access/signup.dart';
import 'package:careplus_24/DashBoard/patient_dashboard_screen.dart';
import 'package:careplus_24/Firebase/patients_profile.dart';
import 'package:careplus_24/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PatientsProfile extends StatefulWidget {
  const PatientsProfile({Key? key}) : super(key: key);

  @override
  State<PatientsProfile> createState() => _PatientsProfileState();
}

class _PatientsProfileState extends State<PatientsProfile> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _bloodgroup = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2e30f1),
      appBar: null,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
          right: 35,
          left: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Patient\'s Personal Information',
                  style: TextStyle(
                      fontFamily: 'Alkatra', fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 10, bottom: 10),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                  controller: _name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Name cannot be empty");
                    }

                    return null;
                  },
                  onSaved: (value) {
                    _name.text = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                IntlPhoneField(
                  disableLengthCheck: true,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 10, bottom: 10),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(),
                      )),
                  controller: _phoneNumber,
                  onSaved: (value) {
                    _phoneNumber.text = value! as String;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _date,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 10, bottom: 10),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.calendar_today_rounded),
                      hintText: 'Select Date of Birth ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(3000));

                    if (pickeddate != null) {
                      setState(() {
                        _date.text =
                            DateFormat('mm-dd-yyyy').format(pickeddate);
                      });
                    }
                  },
                  onSaved: (value) {
                    _date.text = value!;
                  },
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 10, bottom: 10),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.bloodtype),
                      hintText: 'Enter your blood group',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  controller: _bloodgroup,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("blood group cannot be empty");
                    }

                    return null;
                  },
                  onSaved: (value) {
                    _bloodgroup.text = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                CSCPicker(
                  showStates: true,
                  showCities: true,
                  dropdownDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  layout: Layout.vertical,
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      stateValue = value!;
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      cityValue = value!;
                    });
                  },
                  countryDropdownLabel: "Select Country",
                  stateDropdownLabel: "Select State",
                  cityDropdownLabel: "Select City",
                  dropdownDialogRadius: 40,
                  searchBarRadius: 40,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      //contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.local_hospital_outlined),
                      hintText: 'Add your house address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  controller: _address,
                  onSaved: (value) {
                    _address.text = value!;
                  },
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Firebase.initializeApp(
                      options: DefaultFirebaseOptions.currentPlatform,
                    );
                    //  checkSignUp();
                    // if (formkey.currentState!.validate()) {

                    // }
                    profileDetailsToFirestore();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    fixedSize: const Size(200, 70),
                    primary: Colors.white,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  profileDetailsToFirestore() async {
    final fireStore = FirebaseFirestore.instance.collection("patientdetails");

    User? user = FirebaseAuth.instance.currentUser;
    PatientProfileModel profileModel = PatientProfileModel();

    profileModel.email = signup.email;
    profileModel.uid = user?.uid;
    profileModel.username = signup.username;
    profileModel.name = _name.text;
    profileModel.phoneNumber = _phoneNumber.text;
    profileModel.dob = _date.text;
    profileModel.age = _age.text;
    profileModel.bloodType = _bloodgroup.text;
    profileModel.address = _address.text;
    profileModel.country = countryValue;
    profileModel.state = stateValue;
    profileModel.city = countryValue;

    String id = DateTime.now().millisecondsSinceEpoch.toString();

    fireStore.doc(id).set(profileModel.toMap());

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const patientdashboardscreen()),
        (route) => false);
  }
}
