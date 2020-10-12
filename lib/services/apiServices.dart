import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:get/get.dart';
import 'package:ustaadapp/services/constants.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import './database.dart';

class ApiServices {
  static final fAuth.FirebaseAuth _auth = fAuth.FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: ['email']);
  static final firestore.FirebaseFirestore _firestore =
      firestore.FirebaseFirestore.instance;
  static final _db = AppDatabase.database;

  static Future<Map<String, dynamic>> storeMapIntoDb(
      String documentID, Map<String, dynamic> data) async {
    _db.document(documentID).insert(data: data).catchError((e) async {
      if (e.toString().contains("found")) {
        _db.document(documentID).update(data: data);
      }
    });
    final snapshot = await _db.document(documentID).get();
    if (snapshot.exists) {
      var xyz = snapshot.data;

      return xyz;
    }
    return {};
  }

  static Future<Map<String, dynamic>> fetchUserDataFromCloud(
      String uid) async {
    var data = {};
    await _firestore
        .collection('Users')
        .doc(uid)
        .get()
        .then((value) async {
      await storeMapIntoDb(Const.userData, value.data())
          .then((value) {
        data = value;
      });
    }).timeout(Duration(seconds: 10));
    return data;
  }

  static getPlans(String goal) async {
    var data = await json.decode(
        await rootBundle.loadString('assets/json/goal_plans.json'));

    switch (goal) {
      case Const.gain:
        return data['goals']['GAIN_MUSCLE'];
        break;
      case Const.maintain:
        return data['goals']['GET_FITTER'];
        break;
      case Const.loose:
        return data['goals']['LOSE_FAT'];
        break;
      default:
    }
  }

  static getPlansDetails(String planCode) async {
    List data = await json.decode(await rootBundle
        .loadString('assets/json/goal_plans.json'))['plans'];

    Map<String, dynamic> result = data
        .where((element) => element['code'] == planCode.trim())
        .toList()[0];
    return result;
  }

  static loadFood() async {
    print("hello");
    List data = await json
        .decode(await rootBundle.loadString('assets/json/food.json'));
    List breakfast = [];
    List lunch = [];

    List snack = [];
    print(data.length);
    for (var item in data) {
      if (item['breakfast'] == 1) {
        breakfast.add(item);
      }
      if (item['main_course'] == 1) {
        lunch.add(item);
      }
      if (item['snack'] == 1) {
        snack.add(item);
      }
    }
    storeMapIntoDb(Const.lunch, {'data': lunch});
    storeMapIntoDb(Const.snack, {'data': snack});
    storeMapIntoDb(Const.breakfast, {'data': breakfast});
  }

  static Future<List> getfood(String category) async {
    final snapshot = await _db.document(category).get();
    if (snapshot.exists) {
      List data = snapshot.data['data'];
      return data;
    }
    return [];
  }

  static Future<fAuth.User> signIn(
      int option, Map<String, dynamic> userData,
      {bool existingUser}) async {
    fAuth.User user;
    print(option);
    switch (option) {
      case 1:
        await googleSignIn(userData, existingUser: existingUser)
            .then((value) {
          //print(value.uid);
          user = value;
        });

        break;
      case 2:
        Get.rawSnackbar(
            duration: Duration(seconds: 2), message: "Facebook");
        //return "";
        break;
      case 3:
        Get.rawSnackbar(
            duration: Duration(seconds: 2), message: "Apple");
        //return "";
        break;
      default:
        return null;
    }
    print(user.displayName);
    return user;
  }

  static Future<fAuth.User> googleSignIn(
      Map<String, dynamic> userData,
      {bool existingUser}) async {
    fAuth.User user;
    //_googleSignIn.signOut();
    bool isSigned = await _googleSignIn.isSignedIn();

    print(isSigned);
    if (isSigned) {
      print("Signed in");

      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount googleUser =
          await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final fAuth.AuthCredential credential =
            fAuth.GoogleAuthProvider.credential(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken);
        user = (await _auth.signInWithCredential(credential)).user;
        userData.addAll({
          "userEmail": user.email.toString(),
          "userName": user.displayName.toString(),
          "userProfile": user.photoURL.toString(),
        });
        if (!existingUser) {
          ApiServices.updateOrCreateUser(user, userData);
        }
      }
    }
    return user;
  }

  static Future updateOrCreateUser(
    fAuth.User user,
    Map<String, dynamic> userData,
  ) async {
    print("Inside updateOrCreateUser of Google SIgn in");

    _firestore
        .doc('Users/${user.uid}')
        .set(userData, firestore.SetOptions(merge: true));
  }
}
