import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:ustaadapp/components/footsteps.dart';
import 'package:ustaadapp/components/homepagebarchart.dart';
import 'package:ustaadapp/components/sleepcard.dart';
import 'package:ustaadapp/components/water_progressbar.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:ustaadapp/pages/constants.dart';

import '../screenSize.dart';

class DashboardPage extends StatefulWidget {
  final fAuth.User user;

  const DashboardPage({Key key, this.user}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DateTime current = DateTime.now();
  TextStyle _greeting = TextStyle(
    fontSize: 16 * ScreenSize.heightMultiplyingFactor,
    fontFamily: "Roboto-Bold",
    color: Colors.white,
  );
  String getMonthName(int month) {
    String actualMonth = "";

    switch (month) {
      case 1:
        actualMonth = "Jan";
        break;
      case 2:
        actualMonth = "Feb";
        break;
      case 3:
        actualMonth = "Mar";
        break;
      case 4:
        actualMonth = "Apr";
        break;
      case 5:
        actualMonth = "May";
        break;
      case 6:
        actualMonth = "Jun";
        break;
      case 7:
        actualMonth = "Jul";
        break;
      case 8:
        actualMonth = "Aug";
        break;
      case 9:
        actualMonth = "Sep";
        break;
      case 10:
        actualMonth = "Oct";
        break;
      case 11:
        actualMonth = "Nov";
        break;
      case 12:
        actualMonth = "Dec";
        break;
      default:
        actualMonth = "Non";
    }
    return actualMonth;
  }

  String getDayName(int day) {
    String actualday = "";

    switch (day) {
      case 1:
        actualday = "Monday";
        break;
      case 2:
        actualday = "Tuesday";
        break;
      case 3:
        actualday = "Wednesday";
        break;
      case 4:
        actualday = "Thursday";
        break;
      case 5:
        actualday = "Friday";
        break;
      case 6:
        actualday = "Saturday";
        break;
      case 7:
        actualday = "Sunday";
        break;
      default:
        actualday = "Non";
    }
    return actualday;
  }

  buildgreetings() {
    return Expanded(
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            8.0 * ScreenSize.heightMultiplyingFactor,
            8.0 * ScreenSize.heightMultiplyingFactor,
            8.0 * ScreenSize.heightMultiplyingFactor,
            8.0 * ScreenSize.heightMultiplyingFactor,
          ),
          child: Column(
            children: [
              Text(
                "${getDayName(current.weekday)}, ${current.day} ${getMonthName(current.month)}",
                style: _greeting,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0 * ScreenSize.heightMultiplyingFactor,
                  5 * ScreenSize.heightMultiplyingFactor,
                  0 * ScreenSize.heightMultiplyingFactor,
                  0 * ScreenSize.heightMultiplyingFactor,
                ),
                child: Container(
                  child: Text(
                    'Hello,${widget.user.displayName}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 22 * ScreenSize.heightMultiplyingFactor,
                      color: Colors.white,
                      fontFamily: "Roboto-Bold",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildKcalPart() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20 * ScreenSize.heightMultiplyingFactor,
        0 * ScreenSize.heightMultiplyingFactor,
        0 * ScreenSize.heightMultiplyingFactor,
        0 * ScreenSize.heightMultiplyingFactor,
      ),
      child: Stack(
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
                150 * ScreenSize.widthMultiplyingFactor,
                150 * ScreenSize.heightMultiplyingFactor,
              ),
              initialChartData: <CircularStackEntry>[
                CircularStackEntry(
                  <CircularSegmentEntry>[
                    CircularSegmentEntry(
                      30.0,
                      Theme.of(context).accentColor,
                      rankKey: "Completed",
                    ),
                    CircularSegmentEntry(
                      70.0,
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
            child: Container(
              height: 90 * ScreenSize.heightMultiplyingFactor,
              width: 90 * ScreenSize.widthMultiplyingFactor,
              child: Center(
                  child: Text(
                '1200 Kcal\n left',
                style: TextStyle(
                    fontFamily: "Quicksand-Medium",
                    fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                    color: Colors.white),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ],
      ),
    );
  }

  buildBar({
    double percent,
    String category,
    String leftString,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0 * ScreenSize.heightMultiplyingFactor,
        3 * ScreenSize.heightMultiplyingFactor,
        0 * ScreenSize.heightMultiplyingFactor,
        3 * ScreenSize.heightMultiplyingFactor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: _greeting,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0 * ScreenSize.heightMultiplyingFactor,
                  0 * ScreenSize.heightMultiplyingFactor,
                  10 * ScreenSize.heightMultiplyingFactor,
                  0 * ScreenSize.heightMultiplyingFactor,
                ),
                child: Container(
                  height: 10 * ScreenSize.heightMultiplyingFactor,
                  width: 120 * ScreenSize.widthMultiplyingFactor,
                  child: RoundedProgressBar(
                    height: 10 * ScreenSize.heightMultiplyingFactor,
                    style: RoundedProgressBarStyle(
                      borderWidth: 0,
                      widthShadow: 0,
                      colorProgress: Theme.of(context).accentColor,
                      backgroundProgress: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(
                        24 * ScreenSize.heightMultiplyingFactor),
                    percent: percent,
                  ),
                ),
              ),
              Text(leftString,
                  style: TextStyle(
                    fontFamily: "Roboto-MediumItalic",
                    fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                    color: Colors.white,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  buildSidePart() {
    return Column(
      children: [
        buildBar(
          category: "Protien",
          leftString: "75g left",
          percent: 80,
        ),
        buildBar(
          category: "Carbs",
          leftString: "525g left",
          percent: 50,
        ),
        buildBar(
          category: "Fat",
          leftString: "61g left",
          percent: 30,
        ),
      ],
    );
  }

  Widget buildSmallRadial({String iconname, double completed, Color color}) {
    return Stack(
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
              80 * ScreenSize.widthMultiplyingFactor,
              80 * ScreenSize.heightMultiplyingFactor,
            ),
            initialChartData: <CircularStackEntry>[
              CircularStackEntry(
                <CircularSegmentEntry>[
                  CircularSegmentEntry(
                    completed,
                    color,
                    rankKey: "Completed",
                  ),
                  CircularSegmentEntry(
                    100 - completed,
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
          child: Container(
              height: 50 * ScreenSize.heightMultiplyingFactor,
              width: 50 * ScreenSize.widthMultiplyingFactor,
              child: Center(
                child: Image.asset(iconname),
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.only(
                bottomLeft:
                    Radius.circular(50 * ScreenSize.heightMultiplyingFactor),
                bottomRight:
                    Radius.circular(50 * ScreenSize.heightMultiplyingFactor),
              ),
            ),
            lightSource: LightSource(0.15, 0.15),
            color: Color.fromRGBO(23, 23, 23, 1),
            shadowLightColor: Colors.black,
            depth: 20,
          ),
          child: Container(
            height: 320 * ScreenSize.heightMultiplyingFactor,
            child: Column(
              children: [
                Row(
                  children: [
                    buildgreetings(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        0 * ScreenSize.heightMultiplyingFactor,
                        0 * ScreenSize.heightMultiplyingFactor,
                        20 * ScreenSize.heightMultiplyingFactor,
                        0 * ScreenSize.heightMultiplyingFactor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            50 * ScreenSize.heightMultiplyingFactor),
                        child: Image.network(
                          widget.user.photoURL,
                          height: 100 * ScreenSize.heightMultiplyingFactor,
                          width: 100 * ScreenSize.widthMultiplyingFactor,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildKcalPart(),
                    buildSidePart(),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 120 * ScreenSize.heightMultiplyingFactor,
          child: ListView(
            scrollDirection: Axis.horizontal,
            //Build Small Radial
            children: [
              buildSmallRadial(
                  completed: 30.0,
                  iconname: "assets/food.png",
                  color: Color.fromRGBO(203, 233, 48, 1)),
              buildSmallRadial(
                  completed: 40.0,
                  iconname: "assets/water.png",
                  color: Color.fromRGBO(161, 175, 195, 1)),
              buildSmallRadial(
                  completed: 55.0,
                  iconname: "assets/walk.png",
                  color: Color.fromRGBO(74, 168, 168, 1)),
              buildSmallRadial(
                  completed: 70.0,
                  iconname: "assets/sleep.png",
                  color: Color.fromRGBO(12, 60, 156, 1)),
              buildSmallRadial(
                  completed: 40.0,
                  iconname: "assets/fit.png",
                  color: Theme.of(context).accentColor),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
          ),
          child: HomePageBarChart(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
          ),
          child: WaterPart(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
          ),
          child: FootStepsCard(
            completedSteps: 36.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
            8 * ScreenSize.heightMultiplyingFactor,
          ),
          child: SleepCard(
            name: widget.user.displayName,
          ),
        ),
      ],
    );
  }
}
