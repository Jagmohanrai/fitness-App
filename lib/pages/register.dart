import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ustaadapp/screenSize.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String name;
  String pass;
  String email;
  bool _autoValidate = false;
  validateInput() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
    }
    setState(() {
      _autoValidate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.navigate_before,
              size: 40,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Neumorphic(
                  style: NeumorphicStyle(
                    depth: -20,
                    color: Color.fromRGBO(23, 23, 23, 1),
                  ),
                  child: Image.asset(
                    "assets/ustaad_icon.png",
                    height: 120 * ScreenSize.heightMultiplyingFactor,
                    width: 120 * ScreenSize.widthMultiplyingFactor,
                  ),
                ),
              ),
              SizedBox(
                height: 50 * ScreenSize.heightMultiplyingFactor,
              ),
              Neumorphic(
                style: NeumorphicStyle(
                  shadowLightColor: Colors.black,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 30,
                  lightSource: LightSource(0.15, 0.15),
                  color: Color.fromRGBO(23, 23, 23, 1),
                ),
                child: Container(
                  height: 150 * ScreenSize.heightMultiplyingFactor,
                  width: 150 * ScreenSize.widthMultiplyingFactor,
                  child: Icon(
                    Icons.account_circle,
                    size: 120 * ScreenSize.heightMultiplyingFactor,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 300 * ScreenSize.heightMultiplyingFactor,
                child: Form(
                  autovalidate: _autoValidate,
                  key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      40 * ScreenSize.heightMultiplyingFactor,
                      20 * ScreenSize.heightMultiplyingFactor,
                      40 * ScreenSize.heightMultiplyingFactor,
                      20 * ScreenSize.heightMultiplyingFactor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          onSaved: (value) {
                            name = value;
                          },
                          validator: (value) {
                            if (value.isNotEmpty)
                              return null;
                            else
                              return "name cannot be empty";
                          },
                          style: TextStyle(
                            fontFamily: "Quicksand-Bold",
                            fontSize: 18,
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
                            labelText: "Name",
                            labelStyle: TextStyle(
                              fontFamily: "Quicksand-Bold",
                              fontSize: 15,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          onSaved: (value) {
                            email = value;
                          },
                          validator: (val) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val);
                            if (emailValid) {
                              return null;
                            } else
                              return "Invalid Email";
                          },
                          style: TextStyle(
                            fontFamily: "Quicksand-Bold",
                            fontSize: 18,
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
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: "Quicksand-Bold",
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        TextFormField(
                          onSaved: (newValue) => pass = newValue,
                          validator: (value) {
                            if (value.length < 8) {
                              return "must be of 8 character";
                            } else
                              return null;
                          },
                          obscureText: true,
                          style: TextStyle(
                            fontFamily: "Quicksand-Bold",
                            fontSize: 18,
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
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontFamily: "Quicksand-Bold",
                              fontSize: 15,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  40 * ScreenSize.heightMultiplyingFactor,
                  0 * ScreenSize.heightMultiplyingFactor,
                  40 * ScreenSize.heightMultiplyingFactor,
                  20 * ScreenSize.heightMultiplyingFactor,
                ),
                child: Neumorphic(
                  padding: EdgeInsets.all(8.0),
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.deepOrange.withOpacity(0.1),
                    color: Color.fromRGBO(23, 23, 23, 1),
                    depth: 20.0,
                    intensity: 5,
                  ),
                  child: ListTile(
                    onTap: () {
                      validateInput();
                      print(name);
                      print(email);
                      print(pass);
                    },
                    dense: true,
                    title: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontFamily: "Quicksand-Bold",
                          fontSize: 18,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
