import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ustaadapp/starter/goalPage.dart';
import 'package:ustaadapp/pages/homePage.dart';
import 'starter/splashScreen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp]);
    fAuth.User _user;
    return GetMaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(23, 23, 23, 1),
          accentColor: Color.fromRGBO(245, 87, 18, 1),
        ),
        home: FutureBuilder(
          // Initialize FlutterFire
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(child: Text("Snaphoshot Error")),
              );
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              fAuth.FirebaseAuth _auth = fAuth.FirebaseAuth.instance;
              _auth.authStateChanges().listen((user) {
                _user = user;
                if (user == null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SplashScreen()));
                } else if (user != null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(user)));
                }
              });
              //return HomePage(_auth.currentUser);
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          },
        ));
  }
}

class HandleMainScreen extends StatefulWidget {
  @override
  _HandleMainScreenState createState() => _HandleMainScreenState();
}

class _HandleMainScreenState extends State<HandleMainScreen> {
  final fAuth.FirebaseAuth _auth = fAuth.FirebaseAuth.instance;
  bool isLoggedIn;
  // ignore: unused_field
  fAuth.User _user;
  String error;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    checkAuthentication();
  }

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      _user = user;
      if (user == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => GoalPage()));
      } else if (user != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage(user)));
      }
    }).onError((e) {
      error = e.toString();
      print("Error in HandleMainScreen\n" + e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child,
      AxisDirection axisDirection) {
    return child;
  }
}
