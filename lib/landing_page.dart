import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:vocabulary/wave.dart';
import 'package:ripple_effect/ripple_effect.dart';
import 'package:csv/csv.dart';
import 'homepage.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final pageKey = RipplePage.createGlobalKey();
  final effectKey = RippleEffect.createGlobalKey();
  Future<void> toNextPage() => Navigator.of(context).push(
        FadeRouteBuilder(
          page: Home(),
        ),
      );
  loadcsv() async {
    var c = await Hive.openBox("landingPage");
    if (c.get("values") == 1) {
    } else if (c.get("values") == null || c.get("values") == 0) {
      final myData =
          await rootBundle.loadString("assets/csv/c1_final_updated.csv");
      List<List<dynamic>> rowsAsListOfValues =
          const CsvToListConverter().convert(myData);
      print(rowsAsListOfValues.removeAt(0));
      print(rowsAsListOfValues.length);

      var box = await Hive.openBox('magoosh');
      box.put("c1", rowsAsListOfValues);
      final c2 = await rootBundle.loadString("assets/csv/c2_full_updated.csv");
      List<List<dynamic>> cw2 = const CsvToListConverter().convert(c2);
      print(cw2.removeAt(0));
      box.put("c2", cw2);
      final c3 = await rootBundle.loadString("assets/csv/c3_final.csv");
      List<List<dynamic>> cw3 = const CsvToListConverter().convert(c3);
      print(cw3.removeAt(0));
      box.put("c3", cw3);
      final c4 = await rootBundle.loadString("assets/csv/c4_final.csv");
      List<List<dynamic>> cw4 = const CsvToListConverter().convert(c4);
      print(cw4.removeAt(0));
      box.put("c4", cw4);
      final c5 = await rootBundle.loadString("assets/csv/c5_final.csv");
      List<List<dynamic>> cw5 = const CsvToListConverter().convert(c5);
      print(cw5.removeAt(0));
      box.put("c5", cw5);
      final c6 = await rootBundle.loadString("assets/csv/c6_final.csv");
      List<List<dynamic>> cw6 = const CsvToListConverter().convert(c6);
      print(cw6.removeAt(0));
      box.put("c6", cw6);
      final b1 = await rootBundle.loadString("assets/csv/b1_final.csv");
      List<List<dynamic>> bw1 = const CsvToListConverter().convert(b1);
      print(bw1.removeAt(0));
      box.put("b1", bw1);
      final b2 = await rootBundle.loadString("assets/csv/b2_final.csv");
      List<List<dynamic>> bw2 = const CsvToListConverter().convert(b2);
      print(bw2.removeAt(0));
      box.put("b2", bw2);
      final b3 = await rootBundle.loadString("assets/csv/b3_final.csv");
      List<List<dynamic>> bw3 = const CsvToListConverter().convert(b3);
      print(bw3.removeAt(0));
      box.put("b3", bw3);
      final b4 = await rootBundle.loadString("assets/csv/b4_final.csv");
      List<List<dynamic>> bw4 = const CsvToListConverter().convert(b4);
      print(bw4.removeAt(0));
      box.put("b4", bw4);
      final b5 = await rootBundle.loadString("assets/csv/b5_final.csv");
      List<List<dynamic>> bw5 = const CsvToListConverter().convert(b5);
      print(bw5.removeAt(0));
      box.put("b5", bw5);
      final b6 = await rootBundle.loadString("assets/csv/b6_final.csv");
      List<List<dynamic>> bw6 = const CsvToListConverter().convert(b6);
      print(bw6.removeAt(0));
      box.put("b6", bw6);
      final a1 = await rootBundle.loadString("assets/csv/a1_final.csv");
      List<List<dynamic>> aw1 = const CsvToListConverter().convert(a1);
      print(aw1.removeAt(0));
      box.put("a1", aw1);
      var b = await Hive.openBox("landingPage");
      b.put("values", 0);
      print("hi");
    }
  }

  test() async {
    // print(a);
    // print(a[0]);
    // a[0][0] = "aberration";

    // box.put('c1', a);
    // var b = box.get("c1");
    // print(b[0][0]);
  }
  Future toggle() async {
    var b = await Hive.openBox("landingPage");
    b.put("values", 1);
    print(b.get("values"));
  }

  @override
  void initState() {
    loadcsv();
    // test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RipplePage(
      pageKey: pageKey,
      child: Scaffold(
        backgroundColor: Color(0xFF030303),
        body: Stack(children: [
          MyAnimation(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "YOUR",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PatuaOne",
                          fontSize: (height + width) * 0.038),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Personalized",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "MajorMonoDisplay",
                          fontSize: (height + width) * 0.032),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "VOCABULARY",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PatuaOne",
                          fontSize: (height + width) * 0.038),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Text(
                  "A simple but very useful application for you to enhance your vocabulary and be prepared to ace the language profeciency examinations.",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                      fontSize: (height + width) * 0.013),
                ),
                SizedBox(
                  height: height * 0.15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.8,
                      child: RippleEffect(
                        pageKey: pageKey,
                        effectKey: effectKey,
                        color: Colors.white,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Colors.white,
                            onPressed: () async {
                              await toggle();
                              RippleEffect.start(effectKey, () => toNextPage());
                            },
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "PatuaOne",
                                  fontSize: (height + width) * 0.015),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.15,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
