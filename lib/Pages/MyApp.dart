import 'package:TylSet/Widgets/MainBodyWidget.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({Key key}) : super(key: key);

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TylSet"),
        backgroundColor: Colors.blueAccent,
        toolbarHeight: appBarSize,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/back.png",
            fit: BoxFit.cover,
          ),
          MainBodyWidget(),
        ],
      ),
    );
  }
}
