import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_go/demo/audioplayer_demo.dart';
import 'package:flutter_go/demo/auido_demo.dart';
import 'package:flutter_go/demo/font_demo.dart';
import 'package:flutter_go/demo/image_demo.dart';
import 'package:flutter_go/demo/navigator2_demo.dart';
import 'package:flutter_go/demo/route_demo.dart';
import 'package:flutter_go/demo/sound_demo.dart';
import 'package:flutter_go/demo/statefull_demo.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text("Route Demo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RouteDemo()),
            );
          },
        ),
        ListTile(
          title: Text("Font Demo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FontDemo()),
            );
          },
        ),
        ListTile(
          title: Text("Image Demo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImageDemo()),
            );
          },
        ),
        ListTile(
          title: Text("Statefull Demo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatefullDemo()),
            );
          },
        ),
        ListTile(
          title: Text("Sound Demo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SoundDemo()),
            );
          },
        ),
        ListTile(
          title: Text("Audio Demo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AudioDemo()),
            );
          },
        ),
        ListTile(
          title: Text("Audio Player Demo"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AudioPlayerDemo()),
            );
          },
        ),
      ],
    );
  }
}
