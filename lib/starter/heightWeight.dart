import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../screenSize.dart';
import './genderDob.dart';
import '../components/weight_slider/weight_slider.dart';

class HeightWeight extends StatefulWidget {
  final String goal;
  HeightWeight({
    this.goal,
  });
  @override
  _HeightWeightState createState() => _HeightWeightState();
}

class _HeightWeightState extends State<HeightWeight> {
  int height = 150;
  int weight = 50;

  Widget buildRulerPart(Size size) {
    return Container(
      height: size.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/lengthtape.png',
              ),
            ),
            SizedBox(
              height: 10 * ScreenSize.heightMultiplyingFactor,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                shadowLightColor: Colors.deepOrange.withOpacity(0.1),
                shadowLightColorEmboss: Colors.deepOrange.withOpacity(0.2),
                color: Color.fromRGBO(23, 23, 23, 1),
                depth: 20,
                intensity: 5,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  10 * ScreenSize.heightMultiplyingFactor,
                  10 * ScreenSize.heightMultiplyingFactor,
                  10 * ScreenSize.heightMultiplyingFactor,
                  10 * ScreenSize.heightMultiplyingFactor,
                ),
                child: Text(
                  'Cm',
                  style: TextStyle(
                    fontFamily: "Quicksand-Medium",
                    color: Theme.of(context).accentColor,
                    fontSize: 20 * ScreenSize.heightMultiplyingFactor,
                  ),
                ),
              ),
            ),
            WeightSlider(
              onChange: (val) {
                setState(() {
                  this.height = val;
                });
              },
              maxWeight: 190,
              weight: height,
              minWeight: 130,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                15 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                15 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
              ),
              child: Stack(children: [
                Divider(
                  color: Color.fromRGBO(179, 243, 243, 1),
                  thickness: 2 * ScreenSize.heightMultiplyingFactor,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 15 * ScreenSize.heightMultiplyingFactor,
                  child: VerticalDivider(
                    thickness: 3 * ScreenSize.heightMultiplyingFactor,
                    color: Theme.of(context).accentColor,
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0 * ScreenSize.heightMultiplyingFactor,
                10 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
              ),
              child: Text(
                'Height',
                style: TextStyle(
                    fontFamily: "Quicksand-Medium",
                    color: Colors.white,
                    fontSize: 25 * ScreenSize.heightMultiplyingFactor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWeightPart(Size size) {
    return Container(
      height: size.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Image.asset(
                'assets/weight_icon.png',
              ),
            ),
            SizedBox(
              height: 10 * ScreenSize.heightMultiplyingFactor,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                shadowLightColor: Colors.deepOrange.withOpacity(0.1),
                shadowLightColorEmboss: Colors.deepOrange.withOpacity(0.2),
                color: Color.fromRGBO(23, 23, 23, 1),
                depth: 20,
                intensity: 5,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  10 * ScreenSize.heightMultiplyingFactor,
                  10 * ScreenSize.heightMultiplyingFactor,
                  10 * ScreenSize.heightMultiplyingFactor,
                  10 * ScreenSize.heightMultiplyingFactor,
                ),
                child: Text(
                  'Kg',
                  style: TextStyle(
                    fontFamily: "Quicksand-Medium",
                    color: Theme.of(context).accentColor,
                    fontSize: 20 * ScreenSize.heightMultiplyingFactor,
                  ),
                ),
              ),
            ),
            WeightSlider(
              onChange: (val) {
                setState(() {
                  this.weight = val;
                });
              },
              maxWeight: 140,
              weight: weight,
              minWeight: 30,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                15 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                15 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
              ),
              child: Stack(children: [
                Divider(
                  color: Color.fromRGBO(179, 243, 243, 1),
                  thickness: 2 * ScreenSize.heightMultiplyingFactor,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 15 * ScreenSize.heightMultiplyingFactor,
                  child: VerticalDivider(
                    thickness: 3 * ScreenSize.heightMultiplyingFactor,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0 * ScreenSize.heightMultiplyingFactor,
                8 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
              ),
              child: Text(
                'Weight',
                style: TextStyle(
                  fontFamily: "Quicksand-Medium",
                  color: Colors.white,
                  fontSize: 25 * ScreenSize.heightMultiplyingFactor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          children: [
            buildRulerPart(size),
            buildWeightPart(size),
          ],
        ),
      ),
      floatingActionButton: Card(
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 2,
        child: Container(
          height: 40 * ScreenSize.heightMultiplyingFactor,
          width: 100 * ScreenSize.widthMultiplyingFactor,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GenderDob(
                    goal: widget.goal,
                    height: height,
                    weight: weight,
                  ),
                ),
              );
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
