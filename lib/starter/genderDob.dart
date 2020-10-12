import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'dailyActivity.dart';
import 'package:ustaadapp/screenSize.dart';

class GenderDob extends StatefulWidget {
  final String goal;
  final int height;
  final int weight;
  GenderDob({
    this.goal,
    this.height,
    this.weight,
  });

  @override
  _GenderDobState createState() => _GenderDobState();
}

class _GenderDobState extends State<GenderDob> {
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

  double unSelectedDepth = 10;
  double selectedDepth = -20;
  String current = "";
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget buildDateCards(String value) {
    return Neumorphic(
      style: NeumorphicStyle(
          shadowLightColor: Colors.deepOrange.withOpacity(0.1),
          shadowLightColorEmboss: Colors.deepOrange.withOpacity(0.2),
          intensity: 5,
          depth: 20,
          surfaceIntensity: 0.12,
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(12 * ScreenSize.heightMultiplyingFactor),
          ),
          color: Color.fromRGBO(23, 23, 23, 1)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            10 * ScreenSize.heightMultiplyingFactor,
            10 * ScreenSize.heightMultiplyingFactor,
            10 * ScreenSize.heightMultiplyingFactor,
            10 * ScreenSize.heightMultiplyingFactor,
          ),
          child: Text(
            value,
            style: TextStyle(
              fontFamily: "Quicksand-Bold",
              fontSize: 18 * ScreenSize.heightMultiplyingFactor,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  buildDobPart(context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.4,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                selectDate(context);
              },
              child: Image.asset(
                'assets/calender.png',
              ),
            ),
          ),
          SizedBox(
            height: 10 * ScreenSize.heightMultiplyingFactor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDateCards(selectedDate.day.toString()),
              Image.asset(
                "assets/bigline.png",
                height: 50 * ScreenSize.heightMultiplyingFactor,
              ),
              buildDateCards(getMonthName(selectedDate.month)),
              Image.asset(
                "assets/bigline.png",
                height: 50 * ScreenSize.heightMultiplyingFactor,
              ),
              buildDateCards(selectedDate.year.toString())
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0 * ScreenSize.heightMultiplyingFactor,
              8 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
            ),
            child: Text(
              'BirthDate',
              style: TextStyle(
                fontFamily: "Quicksand-Medium",
                fontSize: 20 * ScreenSize.heightMultiplyingFactor,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  buildGenderPart(context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.4,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      current = "male";
                    });
                  },
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shadowLightColor: Colors.deepOrange.withOpacity(0.1),
                        shadowLightColorEmboss:
                            Colors.deepOrange.withOpacity(0.2),
                        intensity: 5,
                        depth:
                            current == "male" ? selectedDepth : unSelectedDepth,
                        surfaceIntensity: 0.12,
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(
                              12 * ScreenSize.heightMultiplyingFactor),
                        ),
                        color: Color.fromRGBO(23, 23, 23, 1)),
                    child: Center(
                      child: Image.asset(
                        'assets/maleicon.png',
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      current = "female";
                    });
                  },
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shadowLightColor: Colors.deepOrange.withOpacity(0.1),
                        shadowLightColorEmboss:
                            Colors.deepOrange.withOpacity(0.2),
                        intensity: 5,
                        depth: current == "female"
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
                      child: Image.asset(
                        'assets/femaleicon.png',
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 75 * ScreenSize.heightMultiplyingFactor),
          Text(
            'Gender',
            style: TextStyle(
              fontFamily: "Quicksand-Medium",
              fontSize: 20 * ScreenSize.heightMultiplyingFactor,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDobPart(context),
            buildGenderPart(context),
          ],
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
              if (selectedDate.year == DateTime.now().year) {
                Get.rawSnackbar(message: "Please Select a valid Date");
                print("year 2020");
              } else if ((DateTime.now().year.toInt() -
                      selectedDate.year.toInt()) <
                  13) {
                Get.rawSnackbar(
                    message:
                        "This app is only for users of age 18 or Above only.");
                print("Minor");
              } else if (current.length == 0) {
                Get.rawSnackbar(message: "Please Select a Gender.");
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DailyActivity(
                      goal: widget.goal,
                      height: widget.height,
                      weight: widget.weight,
                      dob: selectedDate,
                      gender: current,
                    ),
                  ),
                );
              }
              //
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
