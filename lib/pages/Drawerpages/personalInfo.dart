import 'package:flutter/material.dart';
import 'package:ustaadapp/pages/constants.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "Personal Info",
          style: TextStyle(color: accentColor),
        ),
      ),
    );
  }
}
