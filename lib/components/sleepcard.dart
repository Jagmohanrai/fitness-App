import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ustaadapp/screenSize.dart';

class SleepCard extends StatefulWidget {
  final name;
  SleepCard({this.name});
  @override
  _SleepCardState createState() => _SleepCardState();
}

class _SleepCardState extends State<SleepCard> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(18),
        ),
        lightSource: LightSource(0.15, 0.15),
        color: Color.fromRGBO(23, 23, 23, 1),
        shadowLightColor: Colors.black,
        depth: 20,
      ),
      child: Container(
        height: 150 * ScreenSize.heightMultiplyingFactor,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Hi${widget.name}!",
              style: TextStyle(
                fontFamily: "Quicksand-Medium",
                color: Theme.of(context).accentColor,
                fontSize: 20 * ScreenSize.heightMultiplyingFactor,
              ),
            ),
            Text(
              'Did You Sleep at 11:30 PM?',
              style: TextStyle(
                fontFamily: "Quicksand-Medium",
                color: Theme.of(context).accentColor,
                fontSize: 18 * ScreenSize.heightMultiplyingFactor,
              ),
            ),
            Text(
              'Did You Wake up at 5:30 AM?',
              style: TextStyle(
                fontFamily: "Quicksand-Medium",
                color: Theme.of(context).accentColor,
                fontSize: 18 * ScreenSize.heightMultiplyingFactor,
              ),
            ),
            Neumorphic(
              style: NeumorphicStyle(
                boxShape: NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(10),
                ),
                lightSource: LightSource(0.15, 0.15),
                color: Color.fromRGBO(23, 23, 23, 1),
                shadowLightColor: Colors.black,
                depth: 20,
              ),
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    15 * ScreenSize.heightMultiplyingFactor,
                    5 * ScreenSize.heightMultiplyingFactor,
                    15 * ScreenSize.heightMultiplyingFactor,
                    5 * ScreenSize.heightMultiplyingFactor,
                  ),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontFamily: "Quicksand-Medium",
                      color: Colors.white,
                      fontSize: 20 * ScreenSize.heightMultiplyingFactor,
                    ),
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
