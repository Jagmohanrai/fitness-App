import '../components/bottomnavybar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;

import '../screenSize.dart';

Color primaryColor = Color.fromRGBO(23, 23, 23, 1);
Color accentColor = Color.fromRGBO(245, 87, 18, 1);
Color buttonAccentColor = Color.fromRGBO(222, 180, 154, 1);
fAuth.FirebaseAuth auth = fAuth.FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();
NeumorphicStyle getNeuroStyle(
  double depth,
  double radius,
) {
  return NeumorphicStyle(
    boxShape: NeumorphicBoxShape.roundRect(
      BorderRadius.circular(radius),
    ),
    lightSource: LightSource(0.15, 0.15),
    color: primaryColor,
    shadowLightColor: Colors.black,
    depth: depth,
  );
}

Widget buildFoodCard({Size size, String assetname, String foodname}) {
  return Container(
    height: size.height * 0.3 * ScreenSize.heightMultiplyingFactor,
    width: size.width * 0.4 * ScreenSize.widthMultiplyingFactor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          assetname,
        ),
        Flexible(
          child: Text(
            foodname,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 18 * ScreenSize.heightMultiplyingFactor,
              fontFamily: "Roboto-MediumItalic",
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

buildBottonNavButton({
  String name,
  String assetname,
  bool change = false,
  bool bigIcon = false,
  bool main = false,
}) {
  return BottomNavyBarItem(
    textAlign: TextAlign.center,
    activeColor: main ? accentColor.withOpacity(0.15) : buttonAccentColor,
    icon: Image.asset(
      assetname,
      height: bigIcon ? 30 : 22 * ScreenSize.heightMultiplyingFactor,
      width: bigIcon ? 30 : 22 * ScreenSize.widthMultiplyingFactor,
    ),
    title: Text(
      name,
      style: TextStyle(
          color: main ? Colors.white : Colors.black,
          fontFamily: "Quicksand-Medium",
          fontSize: change ? 18 : 20 * ScreenSize.heightMultiplyingFactor),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    ),
  );
}

Widget buildButtons({String name, Function ontap, Size size}) {
  return Neumorphic(
    style: getNeuroStyle(20, 10),
    child: InkWell(
      onTap: ontap,
      child: Container(
        height: size.height * 0.1 * ScreenSize.heightMultiplyingFactor,
        width: size.width * 0.4 * ScreenSize.widthMultiplyingFactor,
        child: Center(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontFamily: "Roboto-Bold",
              color: Colors.white,
              fontSize: 20 * ScreenSize.heightMultiplyingFactor,
            ),
          ),
        ),
      ),
    ),
  );
}
