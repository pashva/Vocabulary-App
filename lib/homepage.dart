import 'dart:math';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:vocabulary/quizPage.dart';
import 'package:vocabulary/word_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  // AnimationController animctrl;
  // Animation<double> animation;
  @override
  void initState() {
    super.initState();
    // animctrl = AnimationController(vsync: this, duration: Duration(seconds: 5));
    // animation = Tween<double>(begin: 0, end: 1).animate(animctrl);
    // animctrl.forward();
    // animctrl.addListener(() {
    //   setState(() {});
    //   print(animctrl.value);
    // });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // backgroundColor: Color(0xFFDFDFDF),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 6,
                        child: IconButton(
                            icon: Icon(
                              Icons.menu_rounded,
                              color: Colors.black,
                            ),
                            onPressed: () async {
                              // var box = await Hive.openBox("magoosh");
                              // var sets = box.get("c1");
                              // // print(sets.length);
                              // List x = List.from(sets);
                              // // print(x.length);
                              // var rng = new Random();
                              // int a = rng.nextInt(x.length);
                              // int b = rng.nextInt(x.length);
                              // int c = rng.nextInt(x.length);
                              // int d = rng.nextInt(x.length);

                              // // print(x[x.length - 1]);
                              // x.removeAt(a);
                              // if (b > a) {
                              //   b--;
                              // }
                              // if (c > a) {
                              //   c--;
                              // }
                              // if (d > a) {
                              //   d--;
                              // }

                              // x.removeAt(b);
                              // if (c > b) {
                              //   c--;
                              // }
                              // if (d > b) {
                              //   d--;
                              // }

                              // x.removeAt(c);
                              // if (d > c) {
                              //   d--;
                              // }
                              // x.removeAt(d);
                              // // print(x.length);
                              // List options1 = [];
                              // List options2 = [];
                              // List options3 = [];
                              // List options4 = [];
                              // for (int i = 0; i < 3; i++) {
                              //   String u = x[rng.nextInt(x.length)][1];

                              //   String v = x[rng.nextInt(x.length)][1];
                              //   String w = x[rng.nextInt(x.length)][1];
                              //   String y = x[rng.nextInt(x.length)][1];
                              //   u = u.trim();
                              //   v = v.trim();
                              //   w = w.trim();
                              //   y = y.trim();
                              //   if (i == 0) {
                              //     print(u);
                              //     print(v);
                              //     print(w);
                              //     print(y);
                              //   }
                              //   if (u == v ||
                              //       w == y ||
                              //       u == w ||
                              //       u == y ||
                              //       v == w ||
                              //       v == y) {
                              //     i--;
                              //   } else {
                              //     options1.add(u);
                              //     options2.add(v);
                              //     options3.add(w);
                              //     options4.add(y);
                              //   }
                              //   print(i);
                              // }
                              // options1.add(x[a][1]);
                              // options2.add(x[b][1]);
                              // options3.add(x[c][1]);
                              // options4.add(x[d][1]);
                              // options1.shuffle();
                              // options2.shuffle();
                              // options3.shuffle();
                              // options4.shuffle();
                              // List booloptions1 = [false, false, false, false];
                              // List booloptions2 = [false, false, false, false];
                              // List booloptions3 = [false, false, false, false];
                              // List booloptions4 = [false, false, false, false];
                              // for (int i = 0; i < 4; i++) {
                              //   if (options1[i] == x[a][1]) {
                              //     booloptions1[i] = true;
                              //     break;
                              //   }
                              // }
                              // for (int i = 0; i < 4; i++) {
                              //   if (options2[i] == x[b][1]) {
                              //     booloptions2[i] = true;
                              //     break;
                              //   }
                              // }
                              // for (int i = 0; i < 4; i++) {
                              //   if (options3[i] == x[c][1]) {
                              //     booloptions3[i] = true;
                              //     break;
                              //   }
                              // }
                              // for (int i = 0; i < 4; i++) {
                              //   if (options4[i] == x[d][1]) {
                              //     booloptions4[i] = true;
                              //     break;
                              //   }
                              // }

                              // List combined = [];
                              // combined.add({
                              //   "id": 1,
                              //   "question": "What does " + x[a][0] + " mean?",
                              //   "options": options1,
                              //   "answer": x[a][1],
                              //   "bool": booloptions1
                              // });
                              // combined.add({
                              //   "id": 2,
                              //   "question": "What does " + x[b][0] + " mean?",
                              //   "options": options2,
                              //   "answer": x[b][1],
                              //   "bool": booloptions2
                              // });
                              // combined.add({
                              //   "id": 3,
                              //   "question": "What does " + x[c][0] + " mean?",
                              //   "options": options3,
                              //   "answer": x[c][1],
                              //   "bool": booloptions3
                              // });
                              // combined.add({
                              //   "id": 4,
                              //   "question": "What does " + x[d][0] + " mean?",
                              //   "options": options4,
                              //   "answer": x[d][1],
                              //   "bool": booloptions4
                              // });
                              // // print(combined);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => QuizPage(
                              //               questions: combined,
                              //             )));
                            }),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 6,
                        child: IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              scheduleAlarm();
                            }),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Good Morning, Pashva!",
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your progress today : 50 /100 words",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Poppins",
                            fontSize: (height + width) * 0.012),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.6,
                          height: 10,
                          child: Material(
                            elevation: 2,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                  backgroundColor: Colors.white,
                                  value: 0.5,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: height * 0.6,
                        child: _currentIndex == 0
                            ? ListView(
                                children: [
                                  Container(
                                    height: height * 0.2,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        PackCard(
                                          name: "Common I",
                                          cid: "c1",
                                        ),
                                        PackCard(name: "Common II", cid: "c2"),
                                        PackCard(
                                          name: "Common III",
                                          cid: "c3",
                                        ),
                                        PackCard(
                                          cid: "c4",
                                          name: "Common IV",
                                        ),
                                        PackCard(
                                          cid: "c5",
                                          name: "Common V",
                                        ),
                                        PackCard(
                                          cid: "c6",
                                          name: "Common VI",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.2,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        PackCard(
                                          cid: "b1",
                                          name: "Basic I",
                                        ),
                                        PackCard(
                                          cid: "b2",
                                          name: "Basic II",
                                        ),
                                        PackCard(
                                          cid: "b3",
                                          name: "Basic III",
                                        ),
                                        PackCard(
                                          cid: "b4",
                                          name: "Basic IV",
                                        ),
                                        PackCard(
                                          cid: "b5",
                                          name: "Basic V",
                                        ),
                                        PackCard(
                                          cid: "b6",
                                          name: "Basic VI",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.2,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        PackCard(
                                          cid: "a1",
                                          name: "Advanced I",
                                        ),
                                        PackCard(
                                          name: "Advanced II",
                                        ),
                                        PackCard(
                                          name: "Advanced III",
                                        ),
                                        PackCard(
                                          name: "Advanced IV",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : ListView(
                                children: [
                                  Container(
                                    height: height * 0.25,
                                    child: BigCard(
                                      name: "Barron's 333",
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: height * 0.25,
                                    child: BigCard(
                                      name: "Barron's 1100",
                                    ),
                                  ),
                                ],
                              ))),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(12.0),
          //     child: BottomNavyBar(
          //       selectedIndex: _currentIndex,
          //       showElevation: true,
          //       itemCornerRadius: 10,
          //       onItemSelected: (index) =>
          //           setState(() => _currentIndex = index),
          //       items: <BottomNavyBarItem>[
          //         BottomNavyBarItem(
          //           icon: Icon(Icons.workspaces_filled),
          //           title: Text('Magoosh'),
          //           activeColor: Colors.black,
          //         ),
          //         BottomNavyBarItem(
          //           icon: Icon(Icons.workspaces_filled),
          //           title: Text('Barrons'),
          //           activeColor: Colors.blue,
          //         ),
          //         BottomNavyBarItem(
          //           icon: Icon(Icons.workspaces_filled),
          //           title: Text(
          //             'Top 100',
          //           ),
          //           activeColor: Colors.pink,
          //         ),
          //         BottomNavyBarItem(
          //           icon: Icon(Icons.workspaces_filled),
          //           title: Text(
          //             'Random',
          //           ),
          //           activeColor: Colors.green,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}

// ignore: must_be_immutable
class PackCard extends StatefulWidget {
  String name;
  String cid;

  PackCard({this.name, this.cid});
  @override
  _PackCardState createState() => _PackCardState();
}

class _PackCardState extends State<PackCard> {
  var rng = new Random();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      color: Color(0xFF030303),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: (height + width) * 0.025,
              top: (height + width) * 0.025,
              right: (height + width) * 0.025,
            ),
            child: Center(
              child: Text(
                widget.name,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontSize: (height + width) * 0.015),
              ),
            ),
          ),
          Container(
            width: width * 0.5,
            child: AvatarGlow(
              glowColor: Colors.white,
              endRadius: (height + width) * 0.02,
              child: IconButton(
                iconSize: 20,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Display_Word(
                                cardpack: widget.name,
                                cardid: widget.cid,
                              )));
                },
                icon: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  width: width * 0.5,
                  height: height * 0.02,
                  child: LinearProgressIndicator(
                      backgroundColor: Color(0xFFDFDFDF),
                      value: rng.nextDouble(),
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Color(0xFF29bb89)))),
            ],
          ),
        ],
      ),
    );
  }
}

class BigCard extends StatefulWidget {
  String name;
  BigCard({this.name});
  @override
  _BigCardState createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> {
  var rng = new Random();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFFa2d0c1),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: (height + width) * 0.025,
              top: (height + width) * 0.025,
              right: (height + width) * 0.025,
              bottom: (height + width) * 0.025,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: "Poppins",
                      fontSize: (height + width) * 0.016),
                ),
                CircularProgressIndicator(
                    strokeWidth: 6,
                    backgroundColor: Color(0xFFDFDFDF),
                    value: rng.nextDouble(),
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xFF0d335d)))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width * 0.5,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    onPressed: () {},
                    child: Text(
                      "Practice this deck",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "PatuaOne",
                          fontSize: (height + width) * 0.015),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void scheduleAlarm() async {
  var scheduledNotificationDateTime = DateTime.now().add(Duration(minutes: 1));
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'alarm_notif',
    'alarm_notif',
    'Channel for Alarm notification',
    icon: 'codex_logo',
    largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
  );

  var iOSPlatformChannelSpecifics = IOSNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.schedule(
      0,
      'Office',
      "Lets practice some words!",
      scheduledNotificationDateTime,
      platformChannelSpecifics);
}
