import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:waveprogressbar_flutter/waveprogressbar_flutter.dart';

class WaterPart extends StatefulWidget {
  @override
  _WaterPartState createState() => _WaterPartState();
}

class _WaterPartState extends State<WaterPart> {
  WaterController _waterController = WaterController();
  double waterHeight = 0.50;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(18),
        ),
        lightSource: LightSource(0.15, 0.15),
        color: Color.fromRGBO(23, 23, 23, 1),
        shadowLightColor: Colors.black,
        depth: 20,
      ),
      child: Container(
        height: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _waterController.changeWaterHeight(waterHeight - 0.10);
                  waterHeight = waterHeight - 0.10;
                });
              },
              child: Neumorphic(
                style: NeumorphicStyle(
                  boxShape: NeumorphicBoxShape.circle(),
                  lightSource: LightSource(0.15, 0.15),
                  color: Color.fromRGBO(23, 23, 23, 1),
                  shadowLightColor: Colors.black,
                  depth: 20,
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/minus.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: WaveProgressBar(
                size: Size(
                  MediaQuery.of(context).size.width * 0.7,
                  MediaQuery.of(context).size.height * 0.25,
                ),
                percentage: waterHeight,
                circleStrokeWidth: 0.1,
                textStyle: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                heightController: _waterController,
                flowSpeed: 0.8,
                waveDistance: 45.0,
                waterColor: Color.fromRGBO(255, 155, 112, 1),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _waterController.changeWaterHeight(waterHeight + 0.10);
                  waterHeight = waterHeight + 0.10;
                });
              },
              child: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                    lightSource: LightSource(0.15, 0.15),
                    color: Color.fromRGBO(23, 23, 23, 1),
                    shadowLightColor: Colors.black,
                    depth: 20,
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/add.png",
                        height: 30,
                        width: 30,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
