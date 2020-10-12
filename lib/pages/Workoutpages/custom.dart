import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ustaadapp/screenSize.dart';
import '../constants.dart';

class Custom extends StatefulWidget {
  @override
  _CustomState createState() => _CustomState();
}

class _CustomState extends State<Custom> {
  String durforeach = "30s";
  String getinpos = "10s";
  String restafter = "2 Ex.";
  String restdur = "15s";
  TextStyle st = TextStyle(
    color: Colors.white,
    fontFamily: "Roboto-Bold",
    fontSize: 20 * ScreenSize.heightMultiplyingFactor,
  );

  TextEditingController name = TextEditingController(text: "Name");
  @override
  Widget build(BuildContext context) {
    void refresh() {
      setState(() {});
    }

    Widget divider = Divider(
      thickness: 2,
      color: Theme.of(context).accentColor,
    );
    Color accentColor = Theme.of(context).accentColor;
    Size size = MediaQuery.of(context).size;
    Widget sizeBox = SizedBox(
      height: 20 * ScreenSize.heightMultiplyingFactor,
    );
    return Padding(
      padding: EdgeInsets.fromLTRB(
        10 * ScreenSize.heightMultiplyingFactor,
        10 * ScreenSize.heightMultiplyingFactor,
        10 * ScreenSize.heightMultiplyingFactor,
        10 * ScreenSize.heightMultiplyingFactor,
      ),
      child: ListView(
        children: [
          SizedBox(
            height: size.height * 0.15 * ScreenSize.heightMultiplyingFactor,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Name of Workout",
                      style: TextStyle(
                        fontFamily: "Roboto-Bold",
                      ),
                    ),
                    content: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "Enter the name",
                        labelText: "Title",
                      ),
                    ),
                    actions: [
                      FlatButton(
                        child: Text(
                          "Done",
                        ),
                        onPressed: () {
                          setState(() {});
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                    titleTextStyle: TextStyle(
                      fontSize: 20 * ScreenSize.heightMultiplyingFactor,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Title",
                  style: st,
                ),
                Text(
                  name.text,
                  style: st,
                ),
              ],
            ),
          ),
          divider,
          sizeBox,
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: Text("Duration"),
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "15s",
                                        groupValue: durforeach,
                                        onChanged: (val) {
                                          setState(() {
                                            durforeach = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("15s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "20s",
                                        groupValue: durforeach,
                                        onChanged: (val) {
                                          setState(() {
                                            durforeach = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("20s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "25s",
                                        groupValue: durforeach,
                                        onChanged: (val) {
                                          setState(() {
                                            durforeach = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("25s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "30s",
                                        groupValue: durforeach,
                                        onChanged: (val) {
                                          setState(() {
                                            durforeach = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("30s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "45s",
                                        groupValue: durforeach,
                                        onChanged: (val) {
                                          setState(() {
                                            durforeach = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("45s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "60s",
                                        groupValue: durforeach,
                                        onChanged: (val) {
                                          setState(() {
                                            durforeach = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("60s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "90s",
                                        groupValue: durforeach,
                                        onChanged: (val) {
                                          setState(() {
                                            durforeach = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("90s"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Duration for each",
                    style: st,
                  ),
                ),
                Row(children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    color: accentColor,
                    size: 22 * ScreenSize.heightMultiplyingFactor,
                  ),
                  Text(
                    durforeach,
                    style: st,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: accentColor,
                    size: 22 * ScreenSize.heightMultiplyingFactor,
                  ),
                ]),
              ],
            ),
          ),
          divider,
          sizeBox,
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: Text(
                          "Get in position",
                        ),
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "5s",
                                        groupValue: getinpos,
                                        onChanged: (val) {
                                          setState(() {
                                            getinpos = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("5s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "10s",
                                        groupValue: getinpos,
                                        onChanged: (val) {
                                          setState(() {
                                            getinpos = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("10s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "15s",
                                        groupValue: getinpos,
                                        onChanged: (val) {
                                          setState(() {
                                            getinpos = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("15s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "20s",
                                        groupValue: getinpos,
                                        onChanged: (val) {
                                          setState(() {
                                            getinpos = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("20s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "30s",
                                        groupValue: getinpos,
                                        onChanged: (val) {
                                          setState(() {
                                            getinpos = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("30s"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Get in Position",
                    style: st,
                  ),
                ),
                Row(children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    color: accentColor,
                    size: 22 * ScreenSize.heightMultiplyingFactor,
                  ),
                  Text(
                    getinpos,
                    style: st,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: accentColor,
                    size: 22 * ScreenSize.heightMultiplyingFactor,
                  ),
                ]),
              ],
            ),
          ),
          divider,
          sizeBox,
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: Text("Rest After"),
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "Ex.",
                                        groupValue: restafter,
                                        onChanged: (val) {
                                          setState(() {
                                            restafter = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("every exercise"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "2 Ex.",
                                        groupValue: restafter,
                                        onChanged: (val) {
                                          setState(() {
                                            restafter = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("every 2 exercise"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "3 Ex.",
                                        groupValue: restafter,
                                        onChanged: (val) {
                                          setState(() {
                                            restafter = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("every 3 exercise"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "4 Ex.",
                                        groupValue: restafter,
                                        onChanged: (val) {
                                          setState(() {
                                            restafter = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("every 4 exercise"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "5 Ex.",
                                        groupValue: restafter,
                                        onChanged: (val) {
                                          setState(() {
                                            restafter = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("every 5 exercise"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "6 Ex.",
                                        groupValue: restafter,
                                        onChanged: (val) {
                                          setState(() {
                                            restafter = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("every 6 exercise"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "9 Ex.",
                                        groupValue: restafter,
                                        onChanged: (val) {
                                          setState(() {
                                            restafter = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("every 9 exercise"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Rest after",
                    style: st,
                  ),
                ),
                Row(children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    color: accentColor,
                    size: 22 * ScreenSize.heightMultiplyingFactor,
                  ),
                  Text(
                    "every $restafter",
                    style: st,
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: accentColor,
                    size: 22 * ScreenSize.heightMultiplyingFactor,
                  ),
                ]),
              ],
            ),
          ),
          divider,
          sizeBox,
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return AlertDialog(
                        title: Text("Get in position"),
                        content: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "15s",
                                        groupValue: restdur,
                                        onChanged: (val) {
                                          setState(() {
                                            restdur = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("15s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "20s",
                                        groupValue: restdur,
                                        onChanged: (val) {
                                          setState(() {
                                            restdur = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("20s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "30s",
                                        groupValue: restdur,
                                        onChanged: (val) {
                                          setState(() {
                                            restdur = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("30s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "45s",
                                        groupValue: restdur,
                                        onChanged: (val) {
                                          setState(() {
                                            restdur = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("45s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "60s",
                                        groupValue: restdur,
                                        onChanged: (val) {
                                          setState(() {
                                            restdur = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("60s"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        activeColor: accentColor,
                                        value: "90s",
                                        groupValue: restdur,
                                        onChanged: (val) {
                                          setState(() {
                                            restdur = val;
                                            Navigator.of(context).pop();
                                            refresh();
                                          });
                                        }),
                                    Text("90s"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Rest for",
                    style: st,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_left,
                      color: accentColor,
                      size: 22,
                    ),
                    Text(
                      restdur,
                      style: st,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: accentColor,
                      size: 22,
                    ),
                  ],
                ),
              ],
            ),
          ),
          divider,
          sizeBox,
          InkWell(
            onTap: () {
              print(
                  "${name.text}\n$durforeach \n $getinpos \n $restafter \n $restdur ");
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Neumorphic(
                style: getNeuroStyle(20, 10),
                child: Container(
                  height: 50 * ScreenSize.heightMultiplyingFactor,
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontSize: 22 * ScreenSize.heightMultiplyingFactor,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
