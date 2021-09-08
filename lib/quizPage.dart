import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  List questions = [];
  QuizPage({this.questions});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentindex = 0;
  int reveal = -1;
  bool rightanswer = false;
  void checkans(int i) {
    print(widget.questions[currentindex]["answer"]);
    print(widget.questions[currentindex]["options"][i]);
    if (widget.questions[currentindex]["answer"] ==
        widget.questions[currentindex]["options"][i]) {
      setState(() {
        reveal = 1;
        rightanswer = true;
      });
    } else {
      setState(() {
        reveal = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  height: height * 0.35,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              widget.questions[currentindex]["question"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.035),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                                color: rightanswer &&
                                        widget.questions[currentindex]["bool"]
                                            [0]
                                    ? Colors.green
                                    : Colors.white,
                                width: 3)),
                        onPressed: () {
                          checkans(0);
                        },
                        child: Text(
                          widget.questions[currentindex]["options"][0],
                          style: TextStyle(
                              // fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: "OpenSans",
                              fontSize: (height + width) * 0.013),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          side: BorderSide(
                              color: rightanswer &&
                                      widget.questions[currentindex]["bool"][1]
                                  ? Colors.green
                                  : Colors.white,
                              width: 3)),
                      onPressed: () {
                        checkans(1);
                      },
                      child: Text(
                        widget.questions[currentindex]["options"][1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontFamily: "OpenSans",
                            fontSize: (height + width) * 0.013),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                                color: rightanswer &&
                                        widget.questions[currentindex]["bool"]
                                            [2]
                                    ? Colors.green
                                    : Colors.white,
                                width: 3)),
                        onPressed: () {
                          checkans(2);
                        },
                        child: Text(
                          widget.questions[currentindex]["options"][2],
                          style: TextStyle(
                              // fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: "OpenSans",
                              fontSize: (height + width) * 0.013),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            side: BorderSide(
                                color: rightanswer &&
                                        widget.questions[currentindex]["bool"]
                                            [3]
                                    ? Colors.green
                                    : Colors.white,
                                width: 3)),
                        onPressed: () {
                          checkans(3);
                        },
                        child: Text(
                          widget.questions[currentindex]["options"][3],
                          style: TextStyle(
                              // fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: "OpenSans",
                              fontSize: (height + width) * 0.013),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
