import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tags/selectable_tags.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:vocabulary/wave.dart';

// ignore: camel_case_types
class Display_Word extends StatefulWidget {
  String cardpack;
  String cardid;
  Display_Word({this.cardpack, this.cardid});
  @override
  _Display_WordState createState() => _Display_WordState();
}

// ignore: camel_case_types
class _Display_WordState extends State<Display_Word> {
  bool _visible = false;
  int wordindex = 0;
  List<dynamic> words;
  List<Tag> wordsyn = [];
  List<bool> tagactive = [false, false, false];
  double mastereds = 0;
  loaddata() async {
    var box = await Hive.openBox("magoosh");
    var a = box.get(widget.cardid);
    int totalcount = 0;
    int onescount = 0;
    for (int i = 0; i < a.length; i++) {
      if (a[i][5] == "1") {
        onescount++;
      }
      totalcount++;
    }
    print(a.length);
    double mastered = onescount / totalcount;
    print(mastered);
    setState(() {
      words = a;
      mastereds = mastered;
    });
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, top: height * 0.01),
              child: Row(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 6,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  Text(
                    widget.cardpack.split(" ")[0] +
                        " Words " +
                        widget.cardpack.split(" ")[1],
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontSize: (height + width) * 0.02),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.1, top: 5),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mastered",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontSize: (height + width) * 0.013),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.1,
                  right: width * 0.1,
                  top: height * 0.01,
                  bottom: height * 0.01),
              child: Container(
                width: double.infinity,
                height: height * 0.04,
                // padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: LiquidLinearProgressIndicator(
                    borderRadius: 30,
                    center: Text(
                      (mastereds * 100).round().toString() + "%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    value: mastereds),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: width * 0.1, top: 5),
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Learning",
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Colors.black,
            //             fontFamily: "Poppins",
            //             fontSize: (height + width) * 0.013),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       left: width * 0.1,
            //       right: width * 0.1,
            //       top: height * 0.01,
            //       bottom: height * 0.01),
            //   child: Container(
            //     width: double.infinity,
            //     height: height * 0.02,
            //     // padding: EdgeInsets.symmetric(horizontal: 24.0),
            //     child: LiquidLinearProgressIndicator(
            //       borderRadius: 30,
            //       center: Text(
            //         ((1 - mastereds) * 100).round().toString() + "%",
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold, color: Colors.black),
            //       ),
            //       backgroundColor: Colors.white,
            //       valueColor: AlwaysStoppedAnimation(Colors.red),
            //       value: 1 - mastereds,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.65,
              width: width * 0.9,
              child: ListView(children: [
                Material(
                  borderRadius: BorderRadius.circular(15),
                  elevation: 5,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                        color: _visible ? Colors.white : Color(0xFF030303),
                        borderRadius: BorderRadius.circular(15)),
                    height: _visible ? height * 0.6 : height * 0.3,
                    width: width * 0.8,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _visible
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        words[wordindex][2].toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: _visible
                                                ? Colors.black
                                                : Colors.white,
                                            fontFamily: "Poppins",
                                            fontSize:
                                                (height + width) * 0.013)),
                                  )
                                : Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10))),
                                    color: words[wordindex][5] == "1"
                                        ? Color(0xFF90ee90)
                                        : Color(0xFFff9d9d),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          (height + width) * 0.007),
                                      child: Text(
                                          words[wordindex][5] == "1"
                                              ? "Mastered"
                                              : "Learning",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: words[wordindex][5] == "1"
                                                  ? Colors.green
                                                  : Colors.red,
                                              fontFamily: "Poppins",
                                              fontSize:
                                                  (height + width) * 0.013)),
                                    ),
                                  ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15)),
                                  shape: BoxShape.rectangle,
                                  color:
                                      _visible ? Colors.black : Colors.white),
                              child: IconButton(
                                  color: Colors.black,
                                  icon: Icon(
                                    Icons.music_note_rounded,
                                    color:
                                        _visible ? Colors.white : Colors.black,
                                  ),
                                  onPressed: () async {
                                    FlutterTts flutterTts = FlutterTts();
                                    var result = await flutterTts
                                        .speak(words[wordindex][0]);
                                    print(result);
                                    // try {
                                    //   final response =
                                    //       await InternetAddress.lookup(
                                    //           'www.google.com');
                                    //   if (response.isNotEmpty) {
                                    //     final player = AudioPlayer();

                                    //     print(words[wordindex][3]);

                                    //     var duration = await player
                                    //         .setUrl(words[wordindex][3]);
                                    //     print(duration);
                                    //     player.play();
                                    //   }
                                    // } on SocketException catch (err) {
                                    //   Fluttertoast.showToast(
                                    //       msg: "Check your internet connection",
                                    //       toastLength: Toast.LENGTH_LONG,
                                    //       gravity: ToastGravity.BOTTOM,
                                    //       timeInSecForIosWeb: 1,
                                    //       backgroundColor: Colors.white,
                                    //       textColor: Colors.black,
                                    //       fontSize: 14.0);
                                    // }
                                  }),
                            )
                          ],
                        ),
                        _visible
                            ? Text(words[wordindex][0],
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color:
                                        _visible ? Colors.black : Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: (height + width) * 0.02))
                            : Container(
                                margin: EdgeInsets.only(top: height * 0.055),
                                child: Text(words[wordindex][0],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: _visible
                                            ? Colors.black
                                            : Colors.white,
                                        fontFamily: "Poppins",
                                        fontSize: (height + width) * 0.02)),
                              ),
                        _visible
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05,
                                    right: width * 0.05,
                                    top: width * 0.02),
                                child: Text(words[wordindex][1],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: _visible
                                            ? Colors.black
                                            : Colors.white,
                                        fontFamily: "Poppins",
                                        fontSize: (height + width) * 0.014)),
                              )
                            : Container(),
                        _visible
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05,
                                    right: width * 0.05,
                                    top: width * 0.07),
                                child: Text('"' + words[wordindex][4] + '"',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w900,
                                        color: _visible
                                            ? Colors.grey
                                            : Colors.white,
                                        fontFamily: "OpenSans",
                                        fontSize: (height + width) * 0.012)),
                              )
                            : Container(),
                        _visible
                            ? Padding(
                                padding: EdgeInsets.only(top: height * 0.02),
                                child: SelectableTags(
                                  backgroundContainer:
                                      _visible ? Colors.white : Colors.black,
                                  singleItem: false,
                                  symmetry: false,
                                  columns: 8,
                                  tags: wordsyn,
                                  color: Colors.white,
                                  activeColor: Colors.black,
                                  textColor: Colors.black,
                                  textActiveColor: Colors.white,
                                  onPressed: (Tag i) async {
                                    print(i);
                                    setState(() {
                                      tagactive[i.id] = !tagactive[i.id];
                                    });
                                    FlutterTts flutterTts = FlutterTts();
                                    var result = await flutterTts
                                        .speak(wordsyn[i.id].title);
                                    print(result);
                                  },
                                ),
                              )
                            : Container(),
                        Spacer(),
                        !_visible
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: RaisedButton.icon(
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              _visible = !_visible;
                                            });
                                            wordsyn = [];
                                            tagactive = [false, false, false];
                                            if (((words[wordindex].length) -
                                                    1) ==
                                                5) {
                                              wordsyn.add(Tag(title: "None"));
                                            } else {
                                              var c = words[wordindex]
                                                  .sublist(6, 9);

                                              print(c);
                                              for (int i = 0;
                                                  i < c.length;
                                                  i++) {
                                                wordsyn.add(Tag(
                                                    id: i,
                                                    title: c[i],
                                                    active: tagactive[i]));
                                              }
                                            }

                                            setState(() {});
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.black,
                                          ),
                                          label: Text(
                                            "Reveal the meaning",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontFamily: "OpenSans",
                                                fontSize:
                                                    (height + width) * 0.011),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RaisedButton.icon(
                                            color: Color(0xFFd5f5ee),
                                            onPressed: () async {
                                              setState(() {
                                                words[wordindex][5] = "1";
                                                if (wordindex ==
                                                    words.length - 1) {
                                                  wordindex = 0;
                                                } else {
                                                  wordindex++;
                                                }

                                                _visible = !_visible;
                                              });
                                              var box =
                                                  await Hive.openBox("magoosh");

                                              box.put(widget.cardid, words);
                                            },
                                            icon: Icon(
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: Colors.green,
                                            ),
                                            label: Text(
                                              "I knew this meaning",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.green,
                                                  fontFamily: "OpenSans",
                                                  fontSize:
                                                      (height + width) * 0.011),
                                            )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RaisedButton.icon(
                                            color: Color(0xFFffcccb),
                                            onPressed: () async {
                                              setState(() {
                                                words[wordindex][5] = "0";
                                                if (wordindex ==
                                                    words.length - 1) {
                                                  wordindex = 0;
                                                } else {
                                                  wordindex++;
                                                }

                                                _visible = !_visible;
                                              });

                                              var box =
                                                  await Hive.openBox("magoosh");

                                              box.put(widget.cardid, words);
                                            },
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Colors.red,
                                            ),
                                            label: Text(
                                              "I did not know this meaning",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.red,
                                                  fontFamily: "OpenSans",
                                                  fontSize:
                                                      (height + width) * 0.011),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  )
                                ],
                              )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
