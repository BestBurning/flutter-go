import 'package:flutter/material.dart';

import '../component/demo.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Go"),
      ),
      body: Center(child: Demo()),
    );
  }
}
