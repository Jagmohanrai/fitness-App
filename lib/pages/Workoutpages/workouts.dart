import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../screenSize.dart';

class Workouts extends StatefulWidget {
  @override
  _WorkoutsState createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  buildWorkoutCard({
    String title,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        15 * ScreenSize.heightMultiplyingFactor,
        10 * ScreenSize.heightMultiplyingFactor,
        15 * ScreenSize.heightMultiplyingFactor,
        10 * ScreenSize.heightMultiplyingFactor,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(20),
                ),
                lightSource: LightSource(0.15, 0.15),
                color: Color.fromRGBO(23, 23, 23, 1),
                shadowLightColor: Colors.black,
                depth: 20,
              ),
              child: Image.asset(
                "assets/workoutcard.png",
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto-Bold",
                  fontSize: 25 * ScreenSize.heightMultiplyingFactor,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        buildWorkoutCard(title: "Upper Body"),
        buildWorkoutCard(title: "Lower Body"),
        buildWorkoutCard(title: "YOGA"),
        buildWorkoutCard(title: "Custom 1"),
      ],
    );
  }
}
