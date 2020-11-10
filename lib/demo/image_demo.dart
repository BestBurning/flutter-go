import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 15,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Image.asset(
                'images/me.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Image.network(
                'https://wx2.sinaimg.cn/mw690/005uDj95ly1ge8tscze7lj30u00u01cg.jpg',
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : LinearProgressIndicator();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
