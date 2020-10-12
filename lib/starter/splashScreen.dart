import 'dart:async';
import 'package:flutter/material.dart';
import '../screenSize.dart';
import './goalPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => GoalPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 23, 23, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 380,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/ustaad_icon.png",
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              100 * ScreenSize.heightMultiplyingFactor,
              0,
              0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcomes You',
                    style: TextStyle(
                        fontFamily: "Quicksand-Bold",
                        color: Colors.white,
                        fontSize: 22 * ScreenSize.heightMultiplyingFactor),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      8 * ScreenSize.heightMultiplyingFactor,
                      8 * ScreenSize.heightMultiplyingFactor,
                      8 * ScreenSize.heightMultiplyingFactor,
                      8 * ScreenSize.heightMultiplyingFactor,
                    ),
                    child: Text(
                      'Personalized workouts will help you gain \n strength, get in better shape and \nembrace a healthy lifestyle',
                      style: TextStyle(
                        fontFamily: "Quicksand-Regular",
                        color: Colors.white,
                        height: 1.3 * ScreenSize.heightMultiplyingFactor,
                        fontSize: 15 * ScreenSize.heightMultiplyingFactor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
