import '../components/bottomnavybar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ustaadapp/pages/Mealpages/breakfast.dart';
import 'package:ustaadapp/pages/Mealpages/dinner.dart';
import 'package:ustaadapp/pages/Mealpages/lunch.dart';
import 'package:ustaadapp/pages/Mealpages/snacks.dart';
import 'package:ustaadapp/pages/constants.dart';

import '../screenSize.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
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
          BreakfastPage(),
          LunchPage(),
          DinnerPage(),
          SnacksPage(),
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
          style: getNeuroStyle(20, 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavyBar(
              items: [
                buildBottonNavButton(
                  assetname: _selectedIndex == 0
                      ? "assets/breakfastblack.png"
                      : "assets/breakfast.png",
                  name: "Breakfast",
                  change: true,
                ),
                buildBottonNavButton(
                  assetname: _selectedIndex == 1
                      ? "assets/mealblack.png"
                      : "assets/meal.png",
                  name: "Lunch",
                  change: true,
                ),
                buildBottonNavButton(
                  assetname: _selectedIndex == 2
                      ? "assets/Dinnerblack.png"
                      : "assets/dinner.png",
                  name: "Dinner",
                  change: true,
                ),
                buildBottonNavButton(
                  assetname: _selectedIndex == 3
                      ? "assets/snacksblack.png"
                      : "assets/snacks.png",
                  name: "Snacks",
                  change: true,
                  bigIcon: true,
                ),
              ],
              onItemSelected: _onItemTapped,
              backgroundColor: primaryColor,
              animationDuration: Duration(milliseconds: 600),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              selectedIndex: _selectedIndex,
              curve: Curves.easeOut,
            ),
          ),
        ),
      ),
    );
  }
}
