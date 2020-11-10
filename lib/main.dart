import 'package:flutter/material.dart';
import 'package:flutter_go/common/routes.dart';
import 'package:flutter_go/demo/navigator2_demo.dart';

void main() {
  runApp(FlutterGo());
  // runApp(BooksApp());
}

class FlutterGo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.getRoutesMap(context),
    );
  }
}
