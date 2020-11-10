import 'dart:math';

import 'package:flutter/material.dart';

class StatefullDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StatefullDemo();
  }
}

class _StatefullDemo extends State<StatefullDemo> {
  int rollNum = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Demo"),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
            child: FlatButton(
          onPressed: () {
            setState(() {
              rollNum = Random().nextInt(6)+1;
              print(rollNum);
            });
          },
          child: Image.asset(
            'images/dice$rollNum.png',
            width: 200,
          ),
        )),
      ),
    );
  }
}
