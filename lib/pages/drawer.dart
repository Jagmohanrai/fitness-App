import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ustaadapp/Authentication/LoginPage.dart';
import 'package:ustaadapp/pages/Drawerpages/personalInfo.dart';
import 'package:ustaadapp/pages/Drawerpages/settings.dart';
import 'package:ustaadapp/pages/constants.dart';
import 'package:ustaadapp/screenSize.dart';
import 'package:share/share.dart';
import 'package:ustaadapp/starter/goalPage.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Widget buildButtons({String name, Function ontap, Size size}) {
    return Neumorphic(
      style: getNeuroStyle(20, 20),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: size.height * 0.05 * ScreenSize.heightMultiplyingFactor,
          width: size.width * 0.5 * ScreenSize.widthMultiplyingFactor,
          color: primaryColor,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                10 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
                0 * ScreenSize.heightMultiplyingFactor,
              ),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 24 * ScreenSize.heightMultiplyingFactor,
                  fontFamily: "Quicksand-Medium",
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signOut() {
    auth.signOut().then(
      (value) async {
        await googleSignIn.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget divider = SizedBox(
      height: 20,
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/ustaad_icon.png",
              height: size.height * 0.5 * ScreenSize.heightMultiplyingFactor,
            ),
            Container(
              height: size.height * 0.4 * ScreenSize.heightMultiplyingFactor,
              width: size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  0,
                  0,
                  0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    divider,
                    buildButtons(
                      name: "Personal Info.",
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GoalPage(),
                          ),
                        );
                      },
                      size: size,
                    ),
                    divider,
                    buildButtons(
                      name: "Settings",
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings(),
                          ),
                        );
                      },
                      size: size,
                    ),
                    divider,
                    buildButtons(
                      name: "Share App",
                      ontap: () {
                        Share.share(
                            'Hey checkout this app it would be your Digital Ustaad for fitness.\nUstaad App Url');
                      },
                      size: size,
                    ),
                    divider,
                    buildButtons(
                      name: "Sign Out",
                      ontap: signOut,
                      size: size,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
