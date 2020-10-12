import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ustaadapp/pages/constants.dart';
import 'package:ustaadapp/pages/dashboardpage.dart';
import 'package:ustaadapp/pages/drawer.dart';
import 'package:ustaadapp/pages/mealpage.dart';
import 'package:ustaadapp/pages/workoutpage.dart';
import 'package:ustaadapp/screenSize.dart';
import '../components/bottomnavybar.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  final fAuth.User user;
  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 1), curve: Curves.ease);
      },
    );
  }

  Radius r = Radius.circular(50 * ScreenSize.heightMultiplyingFactor);

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DrawerPage(),
                ),
              );
            },
            child: Icon(
              Icons.menu,
              size: 30 * ScreenSize.heightMultiplyingFactor,
              color: buttonAccentColor,
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          scrollDirection: Axis.horizontal,
          children: [
            MealPage(),
            DashboardPage(
              user: widget.user,
            ),
            WorkoutPage(),
          ],
        ),
        bottomNavigationBar: BottomNavyBar(
          animationDuration: Duration(milliseconds: 0),
          containerHeight: 56 * ScreenSize.heightMultiplyingFactor,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          items: [
            buildBottonNavButton(
              assetname: "assets/meal.png",
              name: "Meal",
              main: true,
            ),
            buildBottonNavButton(
              assetname: "assets/home.png",
              name: "Home",
              main: true,
            ),
            buildBottonNavButton(
              assetname: "assets/workout.png",
              name: "Workout",
              main: true,
            ),
          ],
          onItemSelected: _onItemTapped,
          showElevation: true,
          backgroundColor: Colors.black,
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}
