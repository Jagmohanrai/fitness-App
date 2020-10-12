import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ustaadapp/authentication/loginPage.dart';
import 'package:ustaadapp/screenSize.dart';

class DailyActivity extends StatefulWidget {
  final String goal;
  final int height;
  final int weight;
  final String gender;
  final DateTime dob;
  DailyActivity({
    this.dob,
    this.gender,
    this.goal,
    this.height,
    this.weight,
  });
  @override
  _DailyActivityState createState() => _DailyActivityState();
}

class _DailyActivityState extends State<DailyActivity> {
  double unSelectedDepth = 20;
  double selectedDepth = -20;
  int selectedType = 0;

  TextStyle headingsyle = TextStyle(
    fontFamily: "Quicksand-Bold",
    fontSize: 20 * ScreenSize.heightMultiplyingFactor,
    color: Color.fromRGBO(245, 87, 18, 1),
  );
  TextStyle subheadingsyle = TextStyle(
    fontFamily: "Quicksand-Medium",
    fontSize: 15 * ScreenSize.heightMultiplyingFactor,
    color: Colors.white,
  );
  Widget buildTile(String heading, String subHeading, int level) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          selectedType = level;
        });
      },
      child: Neumorphic(
        padding: EdgeInsets.fromLTRB(
          8 * ScreenSize.heightMultiplyingFactor,
          8 * ScreenSize.heightMultiplyingFactor,
          8 * ScreenSize.heightMultiplyingFactor,
          8 * ScreenSize.heightMultiplyingFactor,
        ),
        style: NeumorphicStyle(
          shadowLightColor: Colors.deepOrange.withOpacity(0.1),
          shadowLightColorEmboss: Colors.deepOrange.withOpacity(0.2),
          color: Color.fromRGBO(23, 23, 23, 1),
          depth: selectedType == level ? selectedDepth : unSelectedDepth,
          intensity: 5,
        ),
        child: ListTile(
          title: Text(
            heading,
            style: headingsyle,
          ),
          subtitle: Padding(
            padding: EdgeInsets.fromLTRB(
              0 * ScreenSize.heightMultiplyingFactor,
              8.0 * ScreenSize.heightMultiplyingFactor,
              8.0 * ScreenSize.heightMultiplyingFactor,
              8.0 * ScreenSize.heightMultiplyingFactor,
            ),
            child: Text(
              subHeading,
              style: subheadingsyle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            size: 40 * ScreenSize.heightMultiplyingFactor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              10 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
              10 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40 * ScreenSize.heightMultiplyingFactor,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      20 * ScreenSize.heightMultiplyingFactor,
                      0 * ScreenSize.heightMultiplyingFactor,
                      0 * ScreenSize.heightMultiplyingFactor,
                      0 * ScreenSize.heightMultiplyingFactor,
                    ),
                    child: Text(
                      "Activity Level...",
                      style: TextStyle(
                          fontFamily: "Quicksand-Medium",
                          fontSize: 30 * ScreenSize.heightMultiplyingFactor,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80 * ScreenSize.heightMultiplyingFactor,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                  ),
                  child: buildTile(
                      "Sedentary", "If you get minimal or no exercise", 1),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                  ),
                  child: buildTile("Lightly active",
                      "If you exercise lightly one to three days a week", 2),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                  ),
                  child: buildTile(
                      "Moderately active",
                      "If you exercise moderately three to five days a week",
                      3),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                    8 * ScreenSize.heightMultiplyingFactor,
                  ),
                  child: buildTile(
                      "Very active",
                      "If you engage in hard exercise six to seven days a week",
                      4),
                ),
              ],
            ),
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
              if (selectedType != 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                      goal: widget.goal,
                      height: widget.height,
                      weight: widget.weight,
                      dob: widget.dob,
                      gender: widget.gender,
                      activity: selectedType,
                    ),
                  ),
                );
              } else {
                Get.rawSnackbar(message: "Please Select an Activity Level.");
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: "Quicksand-Regular",
                      fontSize: 16 * ScreenSize.heightMultiplyingFactor),
                ),
                Icon(
                  Icons.navigate_next,
                  size: 26 * ScreenSize.heightMultiplyingFactor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
