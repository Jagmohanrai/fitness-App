import 'package:flutter/material.dart';

import '../constants.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          "Settings",
          style: TextStyle(color: accentColor),
        ),
      ),
    );
  }
}
