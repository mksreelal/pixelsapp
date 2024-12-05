import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pixelsapp/core/route/routeHelper.dart';
import 'package:pixelsapp/core/route/routeName.dart';

class SplashProvider extends ChangeNotifier {
  void initFunction() {
    Timer(Duration(seconds: 3), () {
      pushNamed(RouteName.homeScreen);
    });
  }
}
