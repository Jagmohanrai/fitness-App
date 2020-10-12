import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ustaadapp/authentication/LoginPage.dart';
import './heightWeight.dart';
import 'package:ustaadapp/screenSize.dart';

class GoalPage extends StatefulWidget {
  @override
  _GoalPageState createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  double unSelectedDepth = 10;
  double selectedDepth = -20;
  String current = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.4,
                child: Image.asset("assets/goal_icon.png"),
              ),
              Text(
                'Tell Me Your Goal',
                style: TextStyle(
                  fontFamily: "Quicksand-Medium",
                  fontSize: 22 * ScreenSize.heightMultiplyingFactor,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40 * ScreenSize.heightMultiplyingFactor),
              Container(
                height: 50 * ScreenSize.heightMultiplyingFactor,
                width: size.width * 0.4,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      current = "loose";
                    });
                  },
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shadowLightColor: Colors.deepOrange.withOpacity(0.1),
                        shadowLightColorEmboss:
                            Colors.deepOrange.withOpacity(0.2),
                        intensity: 5,
                        depth: current == "loose"
                            ? selectedDepth
                            : unSelectedDepth,
                        surfaceIntensity: 0.12,
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(
                              12 * ScreenSize.heightMultiplyingFactor),
                        ),
                        color: Color.fromRGBO(23, 23, 23, 1)),
                    child: Center(
                      child: Text(
                        'Lose fat',
                        style: TextStyle(
                            fontFamily: "Quicksand-Medium",
                            color: Color.fromRGBO(245, 87, 18, 1),
                            fontSize: 16 * ScreenSize.heightMultiplyingFactor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20 * ScreenSize.heightMultiplyingFactor),
              Container(
                height: 50 * ScreenSize.heightMultiplyingFactor,
                width: size.width * 0.4,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      current = "maintain";
                    });
                  },
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shadowLightColor: Colors.deepOrange.withOpacity(0.1),
                        shadowLightColorEmboss:
                            Colors.deepOrange.withOpacity(0.2),
                        intensity: 5,
                        depth: current == "maintain"
                            ? selectedDepth
                            : unSelectedDepth,
                        surfaceIntensity: 0.12,
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(
                              12 * ScreenSize.heightMultiplyingFactor),
                        ),
                        color: Color.fromRGBO(23, 23, 23, 1)),
                    child: Center(
                      child: Text(
                        'Get Fitter',
                        style: TextStyle(
                            fontFamily: "Quicksand-Medium",
                            color: Color.fromRGBO(245, 87, 18, 1),
                            fontSize: 16 * ScreenSize.heightMultiplyingFactor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20 * ScreenSize.heightMultiplyingFactor),
              Container(
                height: 50 * ScreenSize.heightMultiplyingFactor,
                width: size.width * 0.4,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      current = "gain";
                    });
                  },
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shadowLightColor: Colors.deepOrange.withOpacity(0.1),
                        shadowLightColorEmboss:
                            Colors.deepOrange.withOpacity(0.2),
                        intensity: 5,
                        depth:
                            current == "gain" ? selectedDepth : unSelectedDepth,
                        surfaceIntensity: 0.12,
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(
                              12 * ScreenSize.heightMultiplyingFactor),
                        ),
                        color: Color.fromRGBO(23, 23, 23, 1)),
                    child: Center(
                      child: Text(
                        'Gain Muscle',
                        style: TextStyle(
                            fontFamily: "Quicksand-Regular",
                            color: Color.fromRGBO(245, 87, 18, 1),
                            fontSize: 16 * ScreenSize.heightMultiplyingFactor),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10 * ScreenSize.heightMultiplyingFactor,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(
                          existingUser: true,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Text(
                      "Already Have an Account?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: Card(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(25 * ScreenSize.heightMultiplyingFactor),
        ),
        elevation: 2,
        child: Container(
          height: 40 * ScreenSize.heightMultiplyingFactor,
          width: 100 * ScreenSize.widthMultiplyingFactor,
          child: FlatButton(
            onPressed: () {
              if (current.length > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HeightWeight(
                      goal: current,
                    ),
                  ),
                );
              } else {
                Get.rawSnackbar(message: "Please Select a Goal");
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                      fontFamily: "Quicksand-Regular",
                      color: Theme.of(context).primaryColor,
                      fontSize: 16 * ScreenSize.heightMultiplyingFactor),
                ),
                Icon(
                  Icons.navigate_next,
                  size: 25 * ScreenSize.heightMultiplyingFactor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
