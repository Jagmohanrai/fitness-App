import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ustaadapp/screenSize.dart';

class FootStepsCard extends StatefulWidget {
  final completedSteps;
  FootStepsCard({this.completedSteps});
  @override
  _FootStepsCardState createState() => _FootStepsCardState();
}

class _FootStepsCardState extends State<FootStepsCard> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
        lightSource: LightSource(0.15, 0.15),
        color: Color.fromRGBO(23, 23, 23, 1),
        shadowLightColor: Colors.black,
        depth: 20,
      ),
      child: Container(
        height: 300,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                    lightSource: LightSource(0.15, 0.15),
                    color: Color.fromRGBO(23, 23, 23, 1),
                    shadowLightColor: Colors.black,
                    depth: 20,
                  ),
                  child: AnimatedCircularChart(
                    size: Size(
                      200,
                      200,
                    ),
                    initialChartData: <CircularStackEntry>[
                      CircularStackEntry(
                        <CircularSegmentEntry>[
                          CircularSegmentEntry(
                            widget.completedSteps,
                            Theme.of(context).accentColor,
                            rankKey: "Completed",
                          ),
                          CircularSegmentEntry(
                            100 - widget.completedSteps,
                            Colors.transparent,
                            rankKey: "Remaining",
                          ),
                        ],
                        rankKey: "Progress",
                      ),
                    ],
                    chartType: CircularChartType.Radial,
                    edgeStyle: SegmentEdgeStyle.round,
                    percentageValues: true,
                  ),
                ),
                Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                    lightSource: LightSource(0.15, 0.15),
                    color: Color.fromRGBO(23, 23, 23, 1),
                    shadowLightColor: Colors.black,
                    depth: 20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/footstep.png",
                          height: 80,
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '1190',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20 * ScreenSize.heightMultiplyingFactor,
                              color: Colors.white,
                              fontFamily: "Quicksand-Medium",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Goal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "Quicksand-Medium",
                        ),
                      ),
                      Text(
                        "10000",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Quicksand-Medium",
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Text(
                        "Steps",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Quicksand-Medium",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
