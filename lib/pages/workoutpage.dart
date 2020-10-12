import '../components/bottomnavybar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ustaadapp/pages/Workoutpages/Plans.dart';
import 'package:ustaadapp/pages/Workoutpages/custom.dart';
import 'package:ustaadapp/pages/Workoutpages/workouts.dart';
import 'package:ustaadapp/pages/constants.dart';

import '../screenSize.dart';

class WorkoutPage extends StatefulWidget {
  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  PageController _pageController;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 1), curve: Curves.ease);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        scrollDirection: Axis.horizontal,
        children: [
          Plans(),
          Workouts(),
          Custom(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.fromLTRB(
          20 * ScreenSize.heightMultiplyingFactor,
          20 * ScreenSize.heightMultiplyingFactor,
          20 * ScreenSize.heightMultiplyingFactor,
          0 * ScreenSize.heightMultiplyingFactor,
        ),
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavyBar(
              items: [
                buildBottonNavButton(
                    assetname: _selectedIndex == 0
                        ? "assets/planblack.png"
                        : "assets/plan.png",
                    name: "Plan"),
                buildBottonNavButton(
                    assetname: _selectedIndex == 1
                        ? "assets/workoutblack.png"
                        : "assets/subworkout.png",
                    name: "Workout"),
                buildBottonNavButton(
                    assetname: _selectedIndex == 2
                        ? "assets/customblack.png"
                        : "assets/custom.png",
                    name: "Custom"),
              ],
              onItemSelected: _onItemTapped,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              backgroundColor: primaryColor,
              selectedIndex: _selectedIndex,
              animationDuration: Duration(milliseconds: 600),
              curve: Curves.easeOut,
            ),
          ),
        ),
      ),
    );
  }
}
