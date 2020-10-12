import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../screenSize.dart';

class Plans extends StatefulWidget {
  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  buildCard({String title, String subtitle}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(20),
          ),
          lightSource: LightSource(0.15, 0.15),
          color: Color.fromRGBO(23, 23, 23, 1),
          shadowLightColor: Colors.black,
          depth: 20,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.18,
          child: Center(
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                    fontFamily: "Roboto-Bold",
                    fontSize: 30 * ScreenSize.heightMultiplyingFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Padding(
                padding: EdgeInsets.fromLTRB(
                  20 * ScreenSize.heightMultiplyingFactor,
                  20 * ScreenSize.heightMultiplyingFactor,
                  20 * ScreenSize.heightMultiplyingFactor,
                  20 * ScreenSize.heightMultiplyingFactor,
                ),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: "Roboto-Bold",
                    fontSize: 25 * ScreenSize.heightMultiplyingFactor,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
        buildCard(subtitle: "HIIT", title: "Day 1"),
        buildCard(subtitle: "Core Tarinig", title: "Day 2"),
        buildCard(subtitle: "Interval Trainig", title: "Day 3"),
        buildCard(subtitle: "Light Cardio", title: "Day 4"),
      ],
    );
  }
}
