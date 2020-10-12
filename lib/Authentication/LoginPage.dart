import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ustaadapp/pages/homePage.dart';
import 'package:ustaadapp/pages/register.dart';
import 'package:ustaadapp/services/apiServices.dart';
import 'package:ustaadapp/screenSize.dart';

class LoginPage extends StatefulWidget {
  final String goal;
  final int height;
  final int weight;
  final String gender;
  final DateTime dob;
  final int activity;
  final bool existingUser;
  LoginPage(
      {this.dob,
      this.gender,
      this.goal,
      this.height,
      this.weight,
      this.activity,
      this.existingUser});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic> userData = {};
  @override
  void initState() {
    super.initState();
    userData = {
      "dob": widget.dob.toString(),
      "gender": widget.gender.toString(),
      "goal": widget.goal,
      "height": widget.height,
      "weight": widget.weight,
      "activity": widget.activity,
    };
    print(userData);
    print(widget.existingUser);
  }

  buildTopPart(Size size) {
    return Container(
      height: size.height * 0.5,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                10 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Your",
                    style: TextStyle(
                      fontFamily: "Quicksand-Bold",
                      fontSize: 40 * ScreenSize.heightMultiplyingFactor,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/ustaad_icon.png",
                  height: size.height * 0.35,
                  width: size.width,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                10 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Is  ready',
                    style: TextStyle(
                        fontFamily: "Quicksand-Bold",
                        fontSize: 40 * ScreenSize.heightMultiplyingFactor,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String heading, Function function, String assetname) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        38 * ScreenSize.heightMultiplyingFactor,
        8 * ScreenSize.heightMultiplyingFactor,
        38 * ScreenSize.heightMultiplyingFactor,
        8 * ScreenSize.heightMultiplyingFactor,
      ),
      child: Neumorphic(
        style: NeumorphicStyle(
          shadowLightColor: Colors.deepOrange.withOpacity(0.1),
          shadowLightColorEmboss: Colors.deepOrange.withOpacity(0.2),
          color: Color.fromRGBO(23, 23, 23, 1),
          depth: 20.0,
          intensity: 5,
        ),
        child: ListTile(
          onTap: function,
          dense: true,
          leading: Image.asset(
            assetname,
            height: 30 * ScreenSize.heightMultiplyingFactor,
            width: 30 * ScreenSize.widthMultiplyingFactor,
          ),
          title: Text(
            heading,
            style: TextStyle(
              fontFamily: "Quicksand-Bold",
              fontSize: 19 * ScreenSize.heightMultiplyingFactor,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }

  handleSignin(int option, Map<String, dynamic> userData) {
    ApiServices.signIn(option, userData,
            existingUser: widget.existingUser ?? false)
        .then((value) {
      print(value.displayName);
      if (value != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(value),
          ),
        );
      } else {
        Get.rawSnackbar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red[400],
            title: "Authentication Failed",
            message: "There was an error. Please Try Again.");
      }
    });
  }

  buildButtonPart(Size size) {
    return Container(
      height: size.height * 0.4,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButton("Sign in with Google", () {
            handleSignin(1, userData);
          }, "assets/google.png"),
          buildButton("Sign in with facebook", () {
            handleSignin(2, userData);
          }, "assets/facebook.png"),
          buildButton("Sign in with apple", () {
            handleSignin(3, userData);
          }, "assets/apple.png"),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0 * ScreenSize.heightMultiplyingFactor,
              8 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
              8 * ScreenSize.heightMultiplyingFactor,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              child: Text(
                "Sign up with E-mail",
                style: TextStyle(
                  fontFamily: "Quicksand-Medium",
                  fontSize: 16 * ScreenSize.heightMultiplyingFactor,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildTopPart(size),
              buildButtonPart(size),
              InkWell(
                onTap: () {},
                child: Text(
                  'By Signing up you agree to Terms of Services \nand Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Quicksand-Medium",
                      color: Colors.white,
                      fontSize: 10 * ScreenSize.heightMultiplyingFactor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
