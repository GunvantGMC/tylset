//dart code

import 'dart:math';  //libary for generating random numbers

import 'package:TylSet/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBodyWidget extends StatefulWidget {
  const MainBodyWidget({Key key}) : super(key: key);

  @override
  _MainBodyWidgetState createState() => _MainBodyWidgetState();
}

class _MainBodyWidgetState extends State<MainBodyWidget> {
  var mainWidth;
  var mainHeight;

  List<int> arrayData = [];
  bool flag = false;

  int imgNo1;
  int imgNo2;
  int score = 0;

  bool isCelebrating = false;

  @override
  void initState() {
    // TODO: implement initState

    setResetRandomNo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainWidth = MediaQuery.of(context).size.width;
    mainHeight = MediaQuery.of(context).size.height - appBarSize;
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                      color: Colors.red,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  "Total Score : $score",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: mainHeight * 0.85,
                width: mainWidth,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2),
                  padding: EdgeInsets.all(1),
                  addRepaintBoundaries: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(0.55),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        border: imgNo1 == index
                            ? Border.all(color: Colors.blueAccent, width: 3)
                            : Border.all(),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(),
                        child: InkWell(
                            onTap: () {
                              if (imgNo1 != index) buttonClicked(index);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Image.asset(
                                  "assets/${getImage(arrayData[index])}"),
                            )),
                      ),
                    );
                  },
                  itemCount: 48,
                ),
              ),
            ],
          ),
        ),
        if (isCelebrating)
          Center(
            child: Container(
              // color: Color(0x44FFFFFF),
              child: Image.asset("assets/images/celebrate.gif"),
            ),
          ),
      ],
    );
  }

  void setResetRandomNo() {
    int count = 0;
    arrayData.clear();
    while (count < 48) {
      int rndNo = Random().nextInt(5) + 1;
      arrayData.add(rndNo);
      count++;
    }
  }

  String getImage(num) {
    // int rndNo = Random().nextInt(5) + 1;
    switch (num) {
      case 1:
        return "images/1.png";
        break;
      case 2:
        return "images/2.png";
        break;
      case 3:
        return "images/3.png";
        break;
      case 4:
        return "images/4.png";
        break;
      case 5:
        return "images/5.png";
        break;
      default:
        return "";
    }
  }

  void buttonClicked(int index) {
    setState(() {
      if (flag) {
        flag = !flag;
        imgNo2 = index;
        if (arrayData[imgNo1] == arrayData[imgNo2]) chanceWin(imgNo1, imgNo2);
        imgNo1 = null;
        imgNo2 = null;
      } else {
        imgNo1 = index;
        flag = !flag;
      }
    });
  }

  chanceWin(int imgNo1, int imgNo2) async {
    setState(() {
      isCelebrating = true;
    });
    int rndNo1, rndNo2;
    do {
      rndNo1 = Random().nextInt(5) + 1;
      rndNo2 = Random().nextInt(5) + 1;
    } while (rndNo1 == arrayData[imgNo1] ||
        rndNo2 == arrayData[imgNo2] ||
        rndNo1 == rndNo2);
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      score += 1;
      arrayData[imgNo1] = rndNo1;
      arrayData[imgNo2] = rndNo2;
      isCelebrating = false;
    });
  }
}
