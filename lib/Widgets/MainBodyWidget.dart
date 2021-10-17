import 'dart:math';

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

  List<int> arrayData = new List();
  bool flag = false;

  int imgNo1;
  int imgNo2;

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
    print("height : " + mainHeight.toString());
    print("height 1: " + (mainHeight * 0.8).toString());
    return Column(
      children: [
        Container(
          height: mainHeight * 0.85,
          width: mainWidth,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
            padding: EdgeInsets.all(1),
            addRepaintBoundaries: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(0.55),
                color: Colors.black45,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: FlatButton(
                      onPressed: () {
                        if (imgNo1 != index) buttonClicked(index);
                        print("Clicked");
                      },
                      padding: EdgeInsets.all(7.0),
                      child: Image.asset(getImage(arrayData[index]))),
                ),
              );
            },
            itemCount: 48,
          ),
        ),
        Container(
          height: mainHeight - (mainHeight * 0.85),
          width: mainWidth,
          // color: Colors.red,
        )
      ],
    );
  }

  void setResetRandomNo() {
    print("set reset");
    int count = 0;
    arrayData.clear();
    while (count < 48) {
      int rndNo = Random().nextInt(5) + 1;
      arrayData.add(rndNo);
      // print("\t " + rndNo.toString());
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
        print("unknown image no = " + num.toString());
        return "";
    }
  }

  void buttonClicked(int index) {
    print("here : " + flag.toString());
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
  }

  chanceWin(int imgNo1, int imgNo2) {
    print("win");
    int rndNo1, rndNo2;
    do {
      rndNo1 = Random().nextInt(5) + 1;
      rndNo2 = Random().nextInt(5) + 1;
    } while (rndNo1 == imgNo1 && rndNo2 == imgNo2);
    setState(() {
      arrayData[imgNo1] = rndNo1;
      arrayData[imgNo2] = rndNo2;
      print("Size" + arrayData.length.toString());
    });
  }
}
