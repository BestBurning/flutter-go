import 'package:flutter/material.dart';
import 'package:flutter_go/view/home_view.dart';

class Routes {
  static const String HOME_ROUTE = "/";

    static Map<String , WidgetBuilder> getRoutesMap(BuildContext context){
    return {
      HOME_ROUTE : (context) => HomeView(),
    };
  }


}

