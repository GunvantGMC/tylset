import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  @override
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch and Win"),
      ),
      body: Center(
        child: Text("The rules for this game are pretty simple"),
	child: Text("• Select same animal at a time"),
	child: Text("• Only one user is allowed to play at a time"),
	child: Text("• Do not use it as betting game play only for fun"),
  child: Text("• No specific time limit to finish the game"),
      ),
    );
  }
}
