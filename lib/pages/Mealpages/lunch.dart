import 'package:flutter/material.dart';

import '../../screenSize.dart';
import '../constants.dart';

class LunchPage extends StatefulWidget {
  @override
  _LunchPageState createState() => _LunchPageState();
}

class _LunchPageState extends State<LunchPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.1 * ScreenSize.heightMultiplyingFactor,
          ),
          Container(
            height: 50 * ScreenSize.heightMultiplyingFactor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30 * ScreenSize.heightMultiplyingFactor,
                ),
                Container(
                  height: 50 * ScreenSize.heightMultiplyingFactor,
                  width: size.width * 0.8 * ScreenSize.widthMultiplyingFactor,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 22 * ScreenSize.heightMultiplyingFactor,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(222, 180, 154, 1),
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(222, 180, 154, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              20 * ScreenSize.heightMultiplyingFactor,
              20 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
              10 * ScreenSize.heightMultiplyingFactor,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 22 * ScreenSize.heightMultiplyingFactor,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFoodCard(
                assetname: "assets/foodimage5.png",
                foodname: "Sample Name of Food - 21Kcal",
                size: size,
              ),
              buildFoodCard(
                assetname: "assets/foodimage6.png",
                foodname: "Sample Name of Food - 21Kcal",
                size: size,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0 * ScreenSize.heightMultiplyingFactor,
              30 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButtons(
                  name: "My Meal",
                  ontap: () {
                    print("pressed");
                  },
                  size: size,
                ),
                buildButtons(
                  name: "Frequent",
                  ontap: () {
                    print("pressed");
                  },
                  size: size,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              30 * ScreenSize.heightMultiplyingFactor,
              25 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
              0 * ScreenSize.heightMultiplyingFactor,
            ),
            child: buildButtons(
              name: "Add Custom ",
              ontap: () {
                print("pressed");
              },
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}